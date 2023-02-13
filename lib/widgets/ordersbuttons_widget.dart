import 'package:flutter/material.dart';
import '../commons/app_strings.dart';
class OrdersButtonsOption extends StatelessWidget {
  final String buttonTitle;
  const OrdersButtonsOption({super.key, required this.buttonTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(child:  Text(buttonTitle, style: heading3,)),
                 );
  }
}