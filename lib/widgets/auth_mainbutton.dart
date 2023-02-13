import 'package:flutter/material.dart';
class AuthMainButton extends StatelessWidget {
  final VoidCallback callback;
  const AuthMainButton({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() {
                   callback();
                }),
      child:   Container(
               height: 60,
               width: double.infinity,
               decoration:const BoxDecoration(
               gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
              0.0,
              1.0, 
               ],
            colors: [Color.fromARGB(255, 242, 198, 122), Color.fromARGB(255, 233, 149, 6)],
            ),
               ),
               child:const Center(
               child: Text('Continue', 
               style: TextStyle(
               fontSize: 20,
               color: Colors.black
                 ),
               ),
            ),
       ),
    );
  }
}