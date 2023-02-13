import 'dart:ui';
import 'package:amazonapp/utils/routes/routes_name.dart';
import 'package:amazonapp/viewmodel/delieveryaddress_viewmodel.dart';
import 'package:amazonapp/viewmodel/detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../commons/app_strings.dart';
import '../commons/ui_helpers.dart';
import '../utils/utils.dart';
import '../viewmodel/cart_viewmodel.dart';
import '../viewmodel/category_viewmodel.dart';
import '../widgets/homelistview_widget.dart';

class ProductDetailScreen extends StatelessWidget {
   const ProductDetailScreen({super.key, });
  @override
  Widget build(BuildContext context) {
    final  ProductDetail? arguments = ModalRoute.of(context)!.settings.arguments as ProductDetail?;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: ListView(
          children: 
          [
            verticalSpaceSmall,
            SizedBox(
            height: 30,
            child: Image.asset('assets/images/amazon.png'),
            ),
           const  Divider(thickness: 2,color: Colors.grey,),
            verticalSpaceSmall,
            SizedBox(
              height: 200,
              width: double.infinity, 
              child: Center(
                child: Image.network(arguments!.image!,fit: BoxFit.fill,
                ),
              ),
            ),
            const  Divider(thickness: 2,color: Colors.grey,),
            verticalSpaceTiny,
             Wrap(
              children : 
              [
                const Text('-20%',style: TextStyle(color: Colors.redAccent,fontSize: 20),),
                horizontalSpaceTiny,
                const Text('PKR', style: TextStyle(fontFeatures: [FontFeature.subscripts()]),),
                horizontalSpaceTiny,
                Text(arguments.price!.toString(),style: heading,),
              ],
             
             ),
            verticalSpaceSmall,
             Text(arguments.title!,style: heading,),
            verticalSpaceTiny,
             Text(arguments.description!,style: heading2,),
            verticalSpaceRegular,
            GestureDetector(
              onTap: ()
              {
                Navigator.pushNamed(context, RoutesName.delieveryAddress);
              },
              child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: 
                [
                  const Icon(Icons.location_on, color: Colors.black,),
                  horizontalSpaceTiny,
                  if(context.watch<DeliveryAddressViewModel>().delieverylocation == "")
                  const  Text('Deliever to Pakistan',style: TextStyle(color: Color.fromARGB(255, 11, 156, 35)),),
                  if(context.watch<DeliveryAddressViewModel>().delieverylocation != "")
                  Text(context.watch<DeliveryAddressViewModel>().delieverylocation,
                   overflow: TextOverflow.ellipsis,
                   maxLines: 2),
                ],
              ),
            ),
            verticalSpaceRegular,
            const Text('In Stock',
            style: TextStyle(color: Color.fromARGB(255, 5, 146, 78),fontSize: 20)
            ),
            verticalSpaceSmall,
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
               children: [
                const Text('Qty',style: TextStyle(fontSize: 18),),
                horizontalSpaceTiny,
                 DropdownButton(
                  value: context.watch<DetailViewProvider>().quantity,
                  icon: const Icon(Icons.keyboard_arrow_down),   
                  items: context.watch<DetailViewProvider>().qty.map((items) {
                    return DropdownMenuItem(
                      alignment: Alignment.center,
                      value: items,
                      child: Text(items.toString()),
                    );
                  }).toList(),
            
                  onChanged: (value) {
                    context.read<DetailViewProvider>().updateQuantity(value);    
                  },
            ),
               ],
             ),
            verticalSpaceSmall,
            
            InkWell(
              onTap: ()
              {
                context.read<CartViewProvider>().addItem(
                  arguments.productId!,
                  arguments.price!,
                  arguments.title!,
                  arguments.description!,
                  arguments.image!,
                  (arguments.rating!).toInt(),
                  context.read<DetailViewProvider>().quantity,
                  context.read<DeliveryAddressViewModel>().delieverylocation,
                  context
                  );
                Utils.showSnackBar('Item Added', context);
              },
              child: Container(
                height: 60,
                width: 200,
                decoration:  BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(25)
                ),
                child:const Center(child:  Text('Add to Cart',style: heading3,)),
              ),
            ),
            verticalSpaceSmall,
              Container(
              height: 60,
              width: 200,
              decoration:  BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(25)
               ),
              child:const Center(child:  Text('Buy Now',style: heading3,)),
             ),
             verticalSpaceSmall,
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const 
              [
                Icon(Icons.delivery_dining_outlined),
                horizontalSpaceTiny,
                Text('Cash on Delievery',style: TextStyle(color: Color.fromARGB(255, 11, 156, 35)),),
              ],
             ),
             const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child:  Text('Similar items you might like',style: heading,)
             ),
             
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              child: SizedBox(
                height: 230,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                       if(arguments.title!.contains('Mobile'))
                        {
                      return  HomeWidget(
                      description: context.watch<CatergoryProvider>().mobileitems[index].description,
                      image      : context.watch<CatergoryProvider>().mobileitems[index].imageurl,
                      price      : context.watch<CatergoryProvider>().mobileitems[index].price,
                      title      : context.watch<CatergoryProvider>().mobileitems[index].title,
                      rating     : context.watch<CatergoryProvider>().mobileitems[index].rating,
                      quantity   : context.watch<CatergoryProvider>().mobileitems[index].quantity,              
                      );
                        }
                      if(arguments.title!.contains('Women\'s'))
                      {
                      return  HomeWidget(
                      description: context.watch<CatergoryProvider>().fashionitems[index].description,
                      image      : context.watch<CatergoryProvider>().fashionitems[index].imageurl,
                      price      : context.watch<CatergoryProvider>().fashionitems[index].price,
                      title      : context.watch<CatergoryProvider>().fashionitems[index].title,
                      rating     : context.watch<CatergoryProvider>().fashionitems[index].rating,
                      quantity   : context.watch<CatergoryProvider>().fashionitems[index].quantity,              
                        );
                     }
                     if(arguments.title!.contains('Sofa'))
                     {
                        return  HomeWidget(
                      description: context.watch<CatergoryProvider>().sofaitems[index].description,
                      image      : context.watch<CatergoryProvider>().sofaitems[index].imageurl,
                      price      : context.watch<CatergoryProvider>().sofaitems[index].price,
                      title      : context.watch<CatergoryProvider>().sofaitems[index].title,
                      rating     : context.watch<CatergoryProvider>().sofaitems[index].rating,
                      quantity   : context.watch<CatergoryProvider>().sofaitems[index].quantity,              
                        );

                     }
                     return const SizedBox();
                  }),        
                ),
              ),
            ),      
          ],
        ),
      ),
    );
  }
}
class ProductDetail 
{
  final String? title;
  final String? description;
  final double? rating;
  final double? quantity;
  final double? price;
  final String? image;
  final String? productId;
  const ProductDetail({this.rating,this.productId, this.quantity, this.image,  this.title, this.description, this.price}); 
}
