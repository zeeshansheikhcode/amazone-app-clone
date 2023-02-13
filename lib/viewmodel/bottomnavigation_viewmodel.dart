import 'package:amazonapp/view/cart_view.dart';
import 'package:amazonapp/view/menu_view.dart';
import 'package:flutter/material.dart';
import '../view/home_view.dart';
import '../view/order_view.dart';
class BottomNavigatorProvider with ChangeNotifier
{
    int page =0;  // Current Page
    List pageoptions =  // All Page Option
   const [
       HomeScreen(),
       OrderView(),
       CartView(),
       MenuScreen()
    ];
    updatePage(int index)
    {
      page = index;
      notifyListeners();
    }
}
