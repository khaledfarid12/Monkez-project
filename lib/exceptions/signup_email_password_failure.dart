import 'package:flutter/foundation.dart';

class SignUpWithEmailAndPasswordFailure{
  final String message ;


  const SignUpWithEmailAndPasswordFailure(
  [

  this.message="An unknown error occurred."
]);
 factory SignUpWithEmailAndPasswordFailure.code (String code)

 {
   switch(code)
   {
     case'weak password':
       return const SignUpWithEmailAndPasswordFailure('please enter a stronger password');
     case'Invalid -email':
       return const SignUpWithEmailAndPasswordFailure('Email is not valid or badly formatted');
     case'email-already-in-use':
       return const SignUpWithEmailAndPasswordFailure('An account exists for that email');
     case'operation-not-allowed':
       return const SignUpWithEmailAndPasswordFailure('operation is not allowed');
     case'user-disabled':
       return const SignUpWithEmailAndPasswordFailure('this user has been disabled');

       default:
         return const SignUpWithEmailAndPasswordFailure();




   }


 }
}