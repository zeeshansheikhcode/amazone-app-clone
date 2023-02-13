
import 'package:amazonapp/utils/routes/routes_name.dart';
import 'package:amazonapp/view/authentication_view.dart';
import 'package:amazonapp/view/cart_view.dart';


import 'package:amazonapp/view/delieveryaddress_view.dart';
import 'package:amazonapp/view/detail_view.dart';
import 'package:amazonapp/view/forgotpassword_view.dart';
import 'package:amazonapp/view/home_view.dart';
import 'package:amazonapp/view/bottomnavigation_view.dart';
import 'package:amazonapp/view/menu_view.dart';
import 'package:amazonapp/view/order_view.dart';
import 'package:amazonapp/view/seemore_view.dart';
import 'package:amazonapp/view/showdepartment_view.dart';
import 'package:flutter/material.dart';
import '../../view/splashscreen.dart';



class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings)
  {

    switch(settings.name)
    {

      case RoutesName.splash :
        return MaterialPageRoute(builder: (BuildContext context)  =>   const SplashScreen());
      case RoutesName.authenicate :
        return MaterialPageRoute(builder: (BuildContext context)  =>    AuthenticationView());
     case RoutesName.home :
        return MaterialPageRoute(builder: (BuildContext context)  =>   const HomeScreen());
      case RoutesName.delieveryAddress :
        return MaterialPageRoute(builder: (BuildContext context)  =>   const DelieveryAddress());
     case RoutesName.detail :
        return MaterialPageRoute(builder: (BuildContext context)  =>   const ProductDetailScreen(),settings:settings);
     case RoutesName.seemore :
        return MaterialPageRoute(builder: (BuildContext context)  =>   const SeeMore(),settings:settings);
     case RoutesName.bottomnavigation :
        return MaterialPageRoute(builder: (BuildContext context)  =>   const BottomNavigationVIew());
     case RoutesName.forgotpassword :
        return MaterialPageRoute(builder: (BuildContext context)  =>   const ForgotPasswordView());
      case RoutesName.menu :
        return MaterialPageRoute(builder: (BuildContext context)  =>   const MenuScreen());
      case RoutesName.order :
        return MaterialPageRoute(builder: (BuildContext context)  =>   const OrderView());
       case RoutesName.showdepartment :
        return MaterialPageRoute(builder: (BuildContext context)  =>   const ShowDepartmentView(),settings:settings);
      case RoutesName.cart :
        return MaterialPageRoute(builder: (BuildContext context)  =>   const CartView());
   default:

        return MaterialPageRoute(builder: (_)
        {
          return const Scaffold(
            body: Center(
              child: Text('No routes Defined'),
            ),
          );
        });
    }
  }
}