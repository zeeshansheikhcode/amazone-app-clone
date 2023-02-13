
import 'package:amazonapp/utils/routes/routes_name.dart';
import 'package:amazonapp/view/detail_view.dart';
import 'package:flutter/material.dart';

import '../commons/app_strings.dart';
import '../commons/ui_helpers.dart';
class HomeWidget extends StatelessWidget {
  final String? productId;
  final String? image;
  final String? title;
  final double? quantity;
  final double? rating;
  final double? price;
  final String? description;
  const HomeWidget({super.key, this.image,this.productId, this.title,this.rating,this.quantity,  this.price, this.description});
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        horizontalSpaceSmall,
        InkWell(
          onTap: () {

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
          child: Container(
            height: 300,
            width: 170,
            decoration:const BoxDecoration(
              color: Colors.white
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: 
              [
                   SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Image.network(image!,
                    fit: BoxFit.cover,
                    )),
                     Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5),
                     child: Align(
                     alignment: Alignment.topLeft,
                     child: Text(title!,
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                     style:heading)),
                   ),
                    Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5),
                     child: Align(
                     alignment: Alignment.topLeft,
                     child: Text(description!,
                     maxLines: 2,
                     style:heading2)),
                   ),
                   
                  horizontalSpaceRegular,
                     Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5),
                     child: Align(
                     alignment: Alignment.topLeft,
                     child: Text(price.toString(),
                     style:const TextStyle(
                      overflow: TextOverflow.ellipsis,  
                      fontWeight: FontWeight.bold, 
                      fontSize: 14
                     ),)),
                   ),         
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}