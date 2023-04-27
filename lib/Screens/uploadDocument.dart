import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class DocumentUploadScreen extends StatefulWidget {
  @override
  _DocumentUploadScreenState createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends State<DocumentUploadScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _documentName;
  DateTime? _expiryDate;
  String? _fileUrl;
  String? _fileName;
  bool _isLoading = false;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
  }

  Future<void> onSelectNotification(String payload) async {
    // Handle notification tap
  }

  Future<void> _scheduleNotification() async {
    final scheduledNotificationDateTime =
        _expiryDate?.subtract(Duration(days: 2));
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high);
    final platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    // ignore: deprecated_member_use
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Document Expiry Reminder',
        'Your document $_documentName is about to expire on ${DateFormat('yyyy-MM-dd').format(_expiryDate!)}.',
        scheduledNotificationDateTime!,
        platformChannelSpecifics);
  }

  Future<void> _uploadDocument() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();

      setState(() {
        _isLoading = true;
      });

      try {
        // Upload file to Firebase Storage
        final result = await FilePicker.platform.pickFiles();
        final file = result?.files.single.path;
        final fileName = result?.files.single.name;
        final storageRef =
            FirebaseStorage.instance.ref().child('documents').child(fileName!);
        final uploadTask = storageRef.putFile(file as File);
        final snapshot = await uploadTask;
        final fileUrl = await snapshot.ref.getDownloadURL();

        // Save document data to Firestore
        final expiryDate = Timestamp.fromDate(_expiryDate!);
        final documentData = {
          'name': _documentName,
          'expiryDate': expiryDate,
          'fileUrl': fileUrl,
          'fileName': fileName,
        };
        await FirebaseFirestore.instance
            .collection('documents')
            .doc()
            .set(documentData);

        // Schedule notification
        await _scheduleNotification();

        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Document uploaded successfully.'),
          duration: Duration(seconds: 3),
        ));
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('An error occurred while uploading the document.'),
          duration: Duration(seconds: 3),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Document'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Document Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a document name.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _documentName = value!;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Expiry Date'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an expiry date.';
                        }
                        return null;
                      },
                      onTap: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (selectedDate != null) {
                          setState(() {
                            _expiryDate = selectedDate;
                          });
                        }
                      },
                      readOnly: true,
                      controller: _expiryDate != null
                          ? TextEditingController(
                              text:
                                  DateFormat('yyyy-MM-dd').format(_expiryDate!))
                          : null,
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _uploadDocument,
                      child: Text('Upload Document'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
