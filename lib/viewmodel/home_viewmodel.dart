import 'package:flutter/material.dart';
import '../widgets/carousel_widget.dart';
class HomeViewModel with ChangeNotifier
{
  List<dynamic> carouselItems = 
  const  [
      Carouselwidget(imageasset: 'assets/images/c1.png'),
      Carouselwidget(imageasset: 'assets/images/c2.png'),
      Carouselwidget(imageasset: 'assets/images/c3.png'),   
    //  Carouselwidget(imageasset: 'assets/images/profile.jpg'),
    ];
  List<String> gridlItems = 
  const  [
      'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
      'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
      'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg'   
    ];
}