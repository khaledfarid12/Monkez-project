import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../home_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _Confirmpasswordcontroller =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  bool _isValid = false;
  bool _isUnique = false;
  RegExp _nationalIdRegex = RegExp(r'^[2-3][0-9]{12}$');
  String? _errorMessage;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  String _firstName = '';
  String _lastName = '';
  String _username = '';
  String _email = '';
  String _nationalId = '';
  String _password = '';
  String _confirmPassword = '';
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: ListView(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _firstName = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _lastName = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _username = value!;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address.';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'National ID',
                      errorText: _errorMessage,
                    ),
                    validator: (value) {
                      if (!_isValid) {
                        return 'Please enter a valid 14-digit national ID number.';
                      } else if (!_isUnique) {
                        return 'This national ID already exists.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        if (value.length == 14) {
                          _isValid = true;
                          _errorMessage = null;
                        } else {
                          _isValid = false;
                          _errorMessage =
                              'Please enter a valid 14-digit national ID number.';
                        }
                        // perform unique check here, for example using a database query
                      });
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password.';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters long.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _Confirmpasswordcontroller,
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        icon: Icon(_obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your password.';
                      } else if (value != _passwordController.text) {
                        return 'Passwords do not match.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {
                        _isLoading ? null : _submitForm();
                      },
                      child: _isLoading
                          ? CircularProgressIndicator()
                          : Text('Registar')),
                ]))));
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      // Register the user with Firebase Authentication
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((userCredential) {
        // Add user data to Firestore
        FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .set({
          'email': _email,
          'username': _username,
          'nationalId': _controller,
          'password': _password
        }).then((value) {
          // Navigate to the home screen
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
          ;
        });
      }).catchError((error) {
        // Handle account creation failure
        print('Error creating account: $error');
      });
    }
  }
}
