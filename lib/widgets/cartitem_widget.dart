import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../commons/app_strings.dart';
import '../commons/ui_helpers.dart';
import '../viewmodel/cart_viewmodel.dart';
class CartItemWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final String? description;
  final double? price;
  final String? productId;
  final String? location;
  final int? quantity;
  const CartItemWidget({super.key, this.image,this.quantity, this.title, this.description, this.price, this.productId, this.location});
  @override
  Widget build(BuildContext context) {
    if(context.watch<CartViewProvider>().once)
    {
      context.watch<CartViewProvider>().quantityvalue = quantity!;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
                mainAxisAlignment : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 170,
                          child: Image.network(image!)),
                         verticalSpaceSmall,
                          Container(
                        height: 42,
                        width: 100,
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: 
                            [
                              GestureDetector(
                                onTap: (){
                                  context.read<CartViewProvider>().removeItem(productId!);
                                },
                                child:const Icon(Icons.delete)),
                              Text(context.read<CartViewProvider>().quantityvalue.toString()),
                              GestureDetector(
                              onTap: ()
                              {
                                  context.read<CartViewProvider>().setOnce(); 
                                  context.read<CartViewProvider>().updateQuantity();   
                              },
                              child:const Icon(Icons.add)),
                            ],
                          ),
                        ),
                      ),

                      ],
                    )),
                    horizontalSpaceTiny,
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: 
                      [
                        Text(title!,style: heading3,),
                        verticalSpaceSmall,
                        Text(description!,
                        maxLines: 2,
                        style: heading3),
                        verticalSpaceTiny,
                    
                    const   Text('In Stock',style :TextStyle(color: Color.fromARGB(255, 10, 152, 83))),
                       verticalSpaceTiny,
                    const   Text('Save more with Subscribe & \nSave >', style: TextStyle(color: Colors.lightBlue),),
                     
                        verticalSpaceSmall,
                        Text(location ==null ? 'Pakistan' : location!,style: heading3),
                       verticalSpaceSmall,
                        Text(price.toString(),style: heading3),
                       verticalSpaceSmall,
                       InkWell(
                        onTap: ()
                        {
                          
                          context.read<CartViewProvider>().removeItem(productId!);
                        },
                         child:Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                          ),
                        child:const Center(
                          child: Text('Delete'),
                        ),
                       )
                       )
                      ],
                    )
                 ),  
                ],
               ),
    );
  }
}