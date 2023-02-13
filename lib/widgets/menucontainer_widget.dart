import 'package:amazonapp/commons/app_strings.dart';
import 'package:flutter/material.dart';
class MenuContainer extends StatelessWidget {
  final String title;
  const MenuContainer({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: double.infinity,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                  
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: 
                    [ 
                     Expanded(child: Text(title,style: heading1,)),
                    const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              );
  }
}