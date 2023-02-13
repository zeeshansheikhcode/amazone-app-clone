import 'package:amazonapp/commons/app_strings.dart';
import 'package:amazonapp/commons/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';
class SeeMoreWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final double? quantity;
  final double? rating;
  final double? price;
  final String? description; 
  final String? productId;
  const SeeMoreWidget({super.key, this.productId,this.image, this.title, this.quantity, this.rating, this.price, this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: const BoxDecoration(
         color: Colors.white, 
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            [
              Expanded(
                flex: 1,
                child: Image.network(image!,fit: BoxFit.fill,)
                ),
               horizontalSpaceSmall,
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: 
                    [
                      verticalSpaceRegular,
                      Text(title!,style: heading1,),
                      verticalSpaceSmall,
                      Text(description!),
                      verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(rating!.toString()),
                          RatingBar.builder(
                          initialRating: rating!,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,
                          itemPadding:const EdgeInsets.all(0),
                          itemBuilder: (context, _) =>const Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                      
                    ),
                   onRatingUpdate: (rating) {
     
                        },
                       ),
                        ],
                      ),
                      verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: 
                        [
                         const Text('from',style: TextStyle(fontFeatures: [FontFeature.subscripts()],
                         fontSize: 10
                         ),),
                         horizontalSpaceTiny,
                         Text('PKR :$price')
                        ],
                      )

                    ],
                    ),
                )
                )
            ],
          ),
        ),
      ),
    );
  }
}