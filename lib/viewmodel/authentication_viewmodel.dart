import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_services.dart';
import '../services/services_locator.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class AuthenticationViewModel with ChangeNotifier
{  
   dynamic result;
   String? name;
   String? email;
   String? password;
   bool isSignin = true;
   bool isPassword = false;
   final FirebaseAuth auth = FirebaseAuth.instance;
   final AuthenticationServices _authenticationService = locator<AuthenticationServices>();
   setSignin(bool value)
   {
       isSignin = value;
       notifyListeners();
   }
   setName(String value)
   {
       name=value;
       notifyListeners();
   }
   setEmail(String value)
   {
       email=value;
       notifyListeners();
   }
       setPassword(String value)
   {
       password=value;
       notifyListeners();
   }
   setIsPassword(value)
   {
       isPassword = value;
       notifyListeners();
   }

    Future<dynamic> createAccount(BuildContext context) async
   {    
       if(email==null && password== null && name== null)
        {
          result = 'Enter Credentials';
          return result ;
        }
    try
     {  

        final res = await _authenticationService.registerNewUser(email!,  password!,name!, context);
        if(res is bool != false)
        {
          email    = null;
          password = null;
          name     = null;
          result   = true;
          notifyListeners();
          return result;
        }
        else 
        { 
          result = res ;
          notifyListeners();
          return result;
        }
     } 
      catch(e)
     {
        e.toString();    
     }
  }

  Future<dynamic> logIn(BuildContext context) async
  { 
     if(email==null && password== null )
        {
          result ='Enter Credentials';
          return result;
        }
  
   try
   {  
         final res = await _authenticationService.signInWithEmailAndPassword(email!,  password!, context);
           if(res is bool != false)
           {
            email    = null;
            password = null;
            name     = null;
            result = true;
            notifyListeners();
            return result;
           }
           else {
             result = res;
             notifyListeners();
             return res;
           }
          
   } 
   catch(e)
    {
      e.toString();
       return false;
        
    }
  }

  Future<dynamic> forgotPassword(BuildContext context) async
  {
     
     if(email==null)
     {
       result = 'Enter Credentials';
       return result;
     }
     try
     {
       final res = await _authenticationService.forgotPassword(email!);
       notifyListeners();
     }
     catch(e)
     {
      e.toString();
     }   
  }

  void loggingOut()
  {
    final res = _authenticationService.logOut();
     notifyListeners();
  }

}