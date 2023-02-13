import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthenticationServices 
{
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String? message ;
   
  
  Future<dynamic> signInWithEmailAndPassword( String email, String password,BuildContext context) async 
   {
    try 
    {    
        final user = await _auth.signInWithEmailAndPassword(
         email: email,
         password: password,
        );
        if(user!=null)
        {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          final username   = await _firestore
                         .collection('Users')
                         .doc(user.user!.uid)
                         .get()
                         .then((value) {
                         return value.data()!['name'];
                         });
       prefs.setString('UserName' , username);                 
       prefs.setString('Email'    , email);
       prefs.setString('Password' , password);
        return user.user != null;
        }
      
    } 
    on FirebaseAuthException catch (e) 
    {

        switch(e.code)
     {
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
       message = 'Wrong password';
       break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
       message = 'No user found with this email.';
       break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
       message ='User disabled.';
       break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
       message = 'Error too many request';
       break;
      case "ERROR_OPERATION_NOT_ALLOWED":
       message = 'Server error, please try again later.';
       break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
       message = 'Email address is invalid.';
       break;
      default:
       message = 'Login failed. Please try again.';
        } 
        return message;     
    }
  }

  Future<dynamic> registerNewUser(String email,  String password,String name,BuildContext context) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
       );
       if(user!= null)
       {
         _firestore.collection('Users')
          .doc(user.user!.uid)
          .set(
            {
               "email"    : email,
               "password" : password,
               "name"     : name,

            }
          );
       SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString('UserName' , name);                 
       prefs.setString('Email'    , email);
       prefs.setString('Password' , password);
        return true;
       }

       if(user.user == null)
       {
        return false;
       }
     
    } 
    on FirebaseAuthException catch (e)
     {
       switch(e.code)
        {
          case "ERROR_EMAIL_ALREADY_IN_USE":
          case "account-exists-with-different-credential":
          case "email-already-in-use":
          message ='Email already used. Go to login page.';
          break;
          case "ERROR_USER_DISABLED":
          case "user-disabled":
          message ='User disabled.';
          break;
          case "ERROR_TOO_MANY_REQUESTS":
          case "operation-not-allowed":
          message = 'Too many requests to log into this account.';
          break;
          case "ERROR_OPERATION_NOT_ALLOWED":
          message = 'Server error, please try again later.';
          break;
          case "ERROR_INVALID_EMAIL":
          case "invalid-email":
          message = 'Email address is invalid.';
          break;
          default:
          message = 'Sign Up Failed';
          break;
        }      
      return message;
    }
  }

   Future<dynamic> forgotPassword(String email) async {
    try {
      final result =  await  _auth.sendPasswordResetEmail(
      email    : email,
      );
      return true;
    } catch (e) {
      return e.toString();
    }
  }
  Future<dynamic> logOut() async {
    try {

      await _auth.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      return true;
    } catch (e) {
      return e.toString();
    }
  }
}