import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateFamilyCommunityScreen extends StatefulWidget {
  @override
  _CreateFamilyCommunityScreenState createState() =>
      _CreateFamilyCommunityScreenState();
}

class _CreateFamilyCommunityScreenState
    extends State<CreateFamilyCommunityScreen> {
  final _formKey = GlobalKey<FormState>();
  final _familyNameController = TextEditingController();
  final _familyLocationController = TextEditingController();
  final _initialNumMembersController = TextEditingController();

  bool _isSaving = false;

  void _saveData() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSaving = true;
      });

      try {
        await FirebaseFirestore.instance.collection('users').add({
          'family_name': _familyNameController.text,
          'family_location': _familyLocationController.text,
          'initial_num_members': int.parse(_initialNumMembersController.text),
        });

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Saved Successfully'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  MaterialPageRoute(
                      builder: (context) => CreateFamilyCommunityScreen());
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } catch (e) {
        setState(() {
          _isSaving = false;
        });

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text(
                'An error occurred while saving the data. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateFamilyCommunityScreen())),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _familyNameController.dispose();
    _familyLocationController.dispose();
    _initialNumMembersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Family Community'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _familyNameController,
                  decoration: InputDecoration(
                    labelText: 'Family Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a family name.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _familyLocationController,
                  decoration: InputDecoration(
                    labelText: 'Family Location',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a family location.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _initialNumMembersController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Initial Number of Family Members',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the initial number of family members.';
                    } else if (int.tryParse(value) == null) {
                      return 'Please enter a valid number.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _isSaving ? null : _saveData,
                  child:
                      _isSaving ? CircularProgressIndicator() : Text('Create'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
