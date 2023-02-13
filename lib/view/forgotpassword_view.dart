import 'package:amazonapp/commons/ui_helpers.dart';
import 'package:amazonapp/utils/utils.dart';
import 'package:amazonapp/viewmodel/authentication_viewmodel.dart';
import 'package:amazonapp/widgets/mytextfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children:  
          [
            verticalSpaceSmall,
           const  Text('Enter your email address and we will' 
                 '\nsend you a reset instructions.',
                 style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                 ),
                 ),
            verticalSpaceTiny,
          const  MyTextField(valuename: 'Email'),
            verticalSpaceSmall,
            GestureDetector(
            onTap: (() 
                  {  
                   context.read<AuthenticationViewModel>().setIsPassword(true); 
                   context.read<AuthenticationViewModel>().forgotPassword(context);
                   Utils.showSnackBar('Email Sent', context);
                   Navigator.pop(context);
                  }),
          child:   Container(
                   height: 60,
                   width: double.infinity,
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                   color:const Color.fromARGB(255, 250, 206, 74)
                   ),
                   child: Center(
                   child: Text(
                    context.watch<AuthenticationViewModel>().isPassword 
                    ?
                    'Email Sent'
                    : 
                    'Reset Password',
                   style:const TextStyle(
                   fontSize: 20,
                   color: Colors.black
                     ),
                   ),
                ),
           ),
        ),
          ],
        ),
      ),
    );
  }
}