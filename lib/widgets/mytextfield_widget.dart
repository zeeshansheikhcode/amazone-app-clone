import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../viewmodel/authentication_viewmodel.dart';
class MyTextField extends StatelessWidget {   
  final String valuename;
  const MyTextField({super.key, required this.valuename,});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
               onChanged: (value) {
                 if(valuename == 'Name')
                 {
                  context.read<AuthenticationViewModel>().setName(value);
                 }
                 else if(valuename == 'Password')
                 {
                   context.read<AuthenticationViewModel>().setPassword(value);
                 }
                 else if(valuename == 'Email')
                 {
                   context.read<AuthenticationViewModel>().setEmail(value);
                 }
                 else
                 {
                    Utils.showSnackBar('Invalid Value', context);
                 }
               },
               obscureText: valuename == 'Password' ? true : false,
               decoration: InputDecoration(
               enabledBorder:const OutlineInputBorder(
               borderSide: BorderSide(width: 3, color: Colors.grey), //<-- SEE HERE
                   ),
               focusedBorder:const OutlineInputBorder(
               borderSide: BorderSide(width: 3, color: Colors.amberAccent),
               ),
               disabledBorder: InputBorder.none,
               filled: true, 
               fillColor: Colors.grey.shade100,
               ),
              
        );
    }
}