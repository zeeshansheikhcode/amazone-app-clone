import 'dart:async';
import 'package:amazonapp/viewmodel/category_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

   @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
           ()
          async { 
          context.read<CatergoryProvider>().fetchAndSetMobile();
          context.read<CatergoryProvider>().fetchAndSetSofa();
          context.read<CatergoryProvider>().fetchAndSetFashion();  
          if(FirebaseAuth.instance.currentUser != null)
          {
            Navigator.pushReplacementNamed(context, RoutesName.bottomnavigation);
          }
          else
          {
            Navigator.pushReplacementNamed(context, RoutesName.authenicate);
          }
         
          }

         );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Image.asset('assets/images/amazon.png')
         ),
      ),
    );
  }

}

