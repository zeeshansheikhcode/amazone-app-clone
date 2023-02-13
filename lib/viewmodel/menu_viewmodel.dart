import 'package:flutter/material.dart';
class MenuViewModel extends ChangeNotifier
{

   bool showDepart = false; 
 
  updatedheight(value)
  {
    showDepart = value;
    notifyListeners();
  }
  // List of items in our dropdown menu
  var departmentName = [   
    'Shop by Department',
    'Fashion',
    'Mobile',
    'Sofa',
  ];
  onSelectDepartment(value)
  {
    
  }
}