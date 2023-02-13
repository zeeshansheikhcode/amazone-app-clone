import 'package:flutter/material.dart';
class Carouselwidget extends StatelessWidget {
  final String imageasset;
  const Carouselwidget({super.key, required this.imageasset});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: 200,
      child: Image.asset(
                imageasset,
                fit: BoxFit.fill,
                width: double.infinity,
        ),
    );
  }
}