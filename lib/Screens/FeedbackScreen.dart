import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  RegExp _phoneRegex = RegExp(r'^\d{11}$');
  String? _errorMessage;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  double _initialRating = 0.0;

  void _submitFeedback() async {
    if (_formKey.currentState!.validate()) {
      // Show rating popup
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Rate us'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('How would you rate our app?'),
              SizedBox(height: 16),
              RatingBar.builder(
                initialRating: _initialRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  _initialRating = rating;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                // Save feedback to Firestore
                await FirebaseFirestore.instance.collection('users').add({
                  'name': _nameController.text,
                  'email': _emailController.text,
                  'phone': _phoneController.text,
                  'message': _messageController.text,
                  'rating': _initialRating,
                });

                Navigator.pop(context); // Close rating popup
                // Close feedback screen
                _messageController.clear();
                _nameController.clear();
                _emailController.clear();
                _phoneController.clear();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Full name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                errorText: _errorMessage,
              ),
              onChanged: (value) {
                setState(() {
                  if (_phoneRegex.hasMatch(value)) {
                    _errorMessage = null;
                  } else {
                    _errorMessage =
                        'Please enter a valid 11-digit phone number.';
                  }
                });
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _messageController,
              decoration: InputDecoration(labelText: 'Leave a message'),
              maxLines: 5,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitFeedback,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
