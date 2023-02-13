
import 'package:flutter/material.dart';

class Utils
{
   static  showSnackBar(String message,BuildContext context)
   {
     return ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
           backgroundColor: Colors.green,
           content: Text(message)),
     );
   }
}