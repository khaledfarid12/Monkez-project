import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/FamilyForm.dart';

import 'package:flutter_application_3/Screens/SignUp/signup_screen.dart';
import 'package:flutter_application_3/Screens/SignUp/widgets/FeedbackScreen.dart';
import 'package:flutter_application_3/Screens/SignUp/widgets/FormScreen.dart';

import 'package:flutter_application_3/Screens/SignUp/widgets/signup_form_widgets.dart';

import 'Screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FeedbackScreen());
  }
}
