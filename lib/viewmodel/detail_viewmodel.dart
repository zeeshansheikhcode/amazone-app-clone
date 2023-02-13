import 'package:flutter/material.dart';
class DetailViewProvider with ChangeNotifier
{
   var qty = [1,2,3,4,5,6,7,8,9,10];
   var quantity = 1;
   String? delieveraddress;

   updateQuantity(value)
   {
     
     quantity=value;
    
     notifyListeners();
     
   }
   
}