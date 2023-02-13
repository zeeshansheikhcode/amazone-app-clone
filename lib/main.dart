import 'package:amazonapp/services/services_locator.dart';
import 'package:amazonapp/utils/routes/routes.dart';
import 'package:amazonapp/utils/routes/routes_name.dart';
import 'package:amazonapp/viewmodel/authentication_viewmodel.dart';
import 'package:amazonapp/viewmodel/cart_viewmodel.dart';
import 'package:amazonapp/viewmodel/order_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:amazonapp/viewmodel/bottomnavigation_viewmodel.dart';
import 'package:amazonapp/viewmodel/category_viewmodel.dart';
import 'package:amazonapp/viewmodel/delieveryaddress_viewmodel.dart';
import 'package:amazonapp/viewmodel/detail_viewmodel.dart';
import 'package:amazonapp/viewmodel/home_viewmodel.dart';
import 'package:amazonapp/viewmodel/menu_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: 
      [
        ChangeNotifierProvider(
          create: (context)=> AuthenticationViewModel()
          ),
        ChangeNotifierProvider(
          create: (context)=> CatergoryProvider()
          ),
        ChangeNotifierProvider(
          create: (context)=> HomeViewModel()
          ),
        ChangeNotifierProvider(
          create: (context)=> DetailViewProvider()
          ),
         ChangeNotifierProvider(
          create: (context)=> DeliveryAddressViewModel()
          ),
       ChangeNotifierProvider(
          create: (context)=> BottomNavigatorProvider()
          ),
        ChangeNotifierProvider(
          create: (context)=> CartViewProvider()
          ),
        ChangeNotifierProvider(
          create: (context)=> MenuViewModel()
          ),
         ChangeNotifierProvider(
          create: (context)=> OrderViewModel()
          ),
      ], 
    child:      
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazone Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
     )
    );
  }
}
