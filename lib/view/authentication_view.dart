
import 'package:amazonapp/commons/app_strings.dart';
import 'package:amazonapp/utils/routes/routes_name.dart';
import 'package:amazonapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../commons/ui_helpers.dart';
import '../viewmodel/authentication_viewmodel.dart';
import '../widgets/auth_mainbutton.dart';
import '../widgets/formtermstext.dart';
import '../widgets/mytextfield_widget.dart';
class AuthenticationView extends StatelessWidget {
   AuthenticationView({super.key});  
  final  FormsText formsText = FormsText();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: 
        [
         Container(
          height: 40,
          width: double.infinity,
          decoration:const BoxDecoration(
            color: Color.fromARGB(255, 245, 237, 237)
          ),
          child: Center(child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Image.asset('assets/images/amazon.png'),
          )),
         ),
        const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Align(
            alignment: Alignment.topLeft,
            child: Text('Welcome',
            style: TextStyle(
               fontSize: 24,
               fontWeight: FontWeight.w500
               ),
             ),
           ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: context.watch<AuthenticationViewModel>().isSignin ? 450 : 500,
              width:  double.infinity,
              decoration:const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: 
                [ 
                  RadioListTile(
                  activeColor: Colors.amber.shade400,  
                  title:RichText(
                   text:const TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 18),
               children: <TextSpan>[
                      TextSpan(text: 'Create Account.', style: heading1),
                      TextSpan(text: 'New to Amazon?',   )
                                ],
                             ),
                          ),
                  value: false, 
                  groupValue: context.watch<AuthenticationViewModel>().isSignin, 
                  onChanged: (value){
                      context.read<AuthenticationViewModel>().setSignin(value!);
                     
                   },
                  ),
                  if(!context.watch<AuthenticationViewModel>().isSignin)
                  Card(
                    child: Container(
                      height: 370,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white
                      ),
                     child: ListView(
                      children: 
                       [
                        const SizedBox(height: 5,),
                        FormsText.formtitle('Enter First and last name'),
                        const MyTextField(valuename: 'Name',),
                        FormsText.formtitle('Enter Email'),
                        const MyTextField(valuename: 'Email',),
                        FormsText.formtitle('Create a password'),
                        const MyTextField(valuename: 'Password',),
                        const SizedBox(height: 20,),
                         AuthMainButton(callback: () async
                         {
                        await  context.read<AuthenticationViewModel>().createAccount(context); 
                            if(context.read<AuthenticationViewModel>().result == true)
                             {
                              Navigator.pushReplacementNamed(context, RoutesName.bottomnavigation);
                              Utils.showSnackBar('Successfully Create Account', context);
                             }
                             else 
                             {
                              Utils.showSnackBar(context.read<AuthenticationViewModel>().result, context);
                             }
                         },),
                        const SizedBox(height: 10,),
                        FormsText.showTermText(),
                       ],
                     ),
                    ),
                  ),
              
                  RadioListTile(
                  activeColor: Colors.amber.shade400,
                  title:RichText(
                   text:const TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 18),
               children: <TextSpan>[
                      TextSpan(text: 'Sign in.', style: heading1),
                      TextSpan(text: 'Already a customer?',   )
                                ],
                             ),
                          ),
                  value: true, 
                  groupValue:  context.watch<AuthenticationViewModel>().isSignin, 
                  
                  onChanged: (value){
                     context.read<AuthenticationViewModel>().setSignin(value!);
                   },
                  ),
                  if( context.watch<AuthenticationViewModel>().isSignin)
                   Card(
                    child: Container(
                      height: 320,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white
                      ),
                     child: ListView(
                      children: 
                       [
                        const SizedBox(height: 5,),
                        FormsText.formtitle('Enter Email'),
                        const MyTextField(valuename: 'Email',),
                        FormsText.formtitle('Enter password'),
                        const MyTextField(valuename: 'Password',),
                        const SizedBox(height: 20,),
                        AuthMainButton(
                          callback: () async{
                             await context.read<AuthenticationViewModel>().logIn(context);
                              if(context.read<AuthenticationViewModel>().result == true)
                              {
                               Navigator.pushReplacementNamed(context, RoutesName.bottomnavigation);
                               Utils.showSnackBar('Successfully Login', context);
                              }
                              else 
                              {
                                Utils.showSnackBar(context.read<AuthenticationViewModel>().result, context);
                              }
                              
                          } 
                        ),
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: () 
                          {
                            Navigator.pushNamed(context, RoutesName.forgotpassword);
                          },
                          child: const Align(
                            alignment: Alignment.topRight,
                            child: Text('Forget Password?',style: TextStyle(color: Colors.black),),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        FormsText.showTermText(),
                       ],
                     ),
                    ),
                  ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:const 
              [
                Text('Condition of Use', style: TextStyle(
                    color: Color.fromARGB(255, 9, 108, 190)
                 )),
                Text('Privacy Notice', style: TextStyle(
                    color: Color.fromARGB(255, 9, 108, 190)
                )),
                Text('Help', style: TextStyle(
                    color: Color.fromARGB(255, 9, 108, 190)
                )),
              ],
            ),
          ),
          verticalSpaceMedium,
          Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  Icon(Icons.copyright,size: 14,color:Colors.black ,),
                  Text('1996-2022,Amazon.com,Inc. or its affiliates',
                  style: TextStyle(
                    color: Colors.black54
                  ),
                ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}