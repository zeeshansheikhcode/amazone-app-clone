import 'package:flutter/material.dart';
import '../commons/app_strings.dart';

class FormsText
{
      static  formtitle (String title)
      {
        return  Align(
                          alignment: Alignment.topLeft,
                          child: Text(title),
                        );
      }
      static  showTermText()
      {
        return  Align(
                          alignment: Alignment.center,
                          child: RichText(
                            textAlign: TextAlign.center,
                           text:const TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 15),
                       children: <TextSpan>[
               TextSpan(text: 'By creating an account,you agree to \n', ),
               TextSpan(text: 'Amazon\'s Condition',style: TextStyle(color:Color.fromARGB(255, 9, 108, 190))),
               TextSpan(text: ' of Use and ',),
               TextSpan(text: 'Privacy Notice',style: TextStyle(color:Color.fromARGB(255, 9, 108, 190))),
              
                   ],
                  ),
                 )
                        );
      }

      static  showHomeScreenHeading(String value)
      {
        return   Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child:  Text(value,style: heading,)
             );
      }

}