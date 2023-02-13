import 'package:flutter/material.dart';

import '../utils/routes/routes_name.dart';
import '../view/detail_view.dart';
class GridHomeWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final double? quantity;
  final double? rating;
  final double? price;
  final String? description;
 final String? productId;
 
  const GridHomeWidget({super.key, this.productId,this.image, this.title, this.quantity, this.rating, this.price, this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.pushNamed(context, RoutesName.detail, 
            arguments: ProductDetail(
              description: description,
              image: image,
              price: price,
              quantity: quantity,
              rating: rating,
              title: title,
              productId: productId,
            ));

      },
      child: SizedBox(
          child: Image.network(image!,fit: BoxFit.fill,),
      ),
    );
  }
}