import 'package:amazonapp/utils/utils.dart';
import 'package:amazonapp/widgets/searchbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../commons/app_strings.dart';
import '../commons/ui_helpers.dart';
import '../viewmodel/cart_viewmodel.dart';
import '../viewmodel/category_viewmodel.dart';
import '../widgets/cartitem_widget.dart';
import '../widgets/formtermstext.dart';
import '../widgets/gridhomewidget.dart';
class CartView extends StatelessWidget {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: 
        [
      
          Container(
          height: 120,
          decoration: const BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [
          0.0,
          1.0, 
           ],
        colors: [Color.fromARGB(255, 89, 245, 245), Colors.white],
        ),
           ),
              child: Column(
                children: 
                [
                 const Expanded(
                    flex: 2,
                    child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: SearchBar(containerwidth: false,),
                    ),
                  ),
                  verticalSpaceSmall,
          Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              height: 30,
              decoration:const BoxDecoration(
                color: Color.fromARGB(255, 230, 250, 250)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const 
                    [
                     Icon(Icons.location_on),
                     horizontalSpaceTiny,
                     Text('Deliever To Pakistan',style: heading3,), 
                     horizontalSpaceTiny,
                     Icon(Icons.arrow_drop_down),
                    ],
                  ),
              ),
            ),
          ),
        ),
                  
         ],
        ),
      ),
       verticalSpaceMedium,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('Subtotal ${context.watch<CartViewProvider>().subtotal} PKR',style: heading3,),
        ),
                  
          verticalSpaceMedium,
            GestureDetector(
              onTap: ()
              {
                  Utils.showSnackBar('Order Confirmed', context); 
                 context.read<CartViewProvider>().clear();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 25,right: 10),
                child: Container(
                height: 50,
                width: 200,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow),
                child: Center(child:  Text('Proceed to checkout  (${context.watch<CartViewProvider>().items.length} Item)',style: heading3,)),
                ),
              ),
            ),
            verticalSpaceSmall,
           const Divider(thickness: 10, color: Colors.grey,),
            if(context.watch<CartViewProvider>().items.isEmpty)
            FormsText.showHomeScreenHeading('You recently viewed this'), 
            if(context.watch<CartViewProvider>().items.isEmpty)
            Container(  
            height: 400,
            padding:const EdgeInsets.all(12.0),  
            child: GridView.builder(  
              physics: const ScrollPhysics(),
              itemCount: 
              context.watch<CatergoryProvider>().sofaitems.length,  
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: 2,  
                  crossAxisSpacing: 2.0,  
                  mainAxisSpacing: 2.0  
              ),  
              itemBuilder: ( context,  index){  
                return GridHomeWidget(
                      productId   : context.watch<CatergoryProvider>().sofaitems[index].productId,
                      description : context.watch<CatergoryProvider>().sofaitems[index].description,
                      image       : context.watch<CatergoryProvider>().sofaitems[index].imageurl,
                      price       : context.watch<CatergoryProvider>().sofaitems[index].price,
                      title       : context.watch<CatergoryProvider>().sofaitems[index].title,
                      rating      : context.watch<CatergoryProvider>().sofaitems[index].rating,
                      quantity    : context.watch<CatergoryProvider>().sofaitems[index].quantity,
                      
                );  
              },  
            )),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
             child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: context.watch<CartViewProvider>().items.length,
              itemBuilder: (context,index)
              {
                 return CartItemWidget(
                    location   : context.watch<CartViewProvider>().items.values.toList()[index].location,
                    image      : context.watch<CartViewProvider>().items.values.toList()[index].image,
                    description: context.watch<CartViewProvider>().items.values.toList()[index].description,
                    price      : context.watch<CartViewProvider>().items.values.toList()[index].price,
                    title      : context.watch<CartViewProvider>().items.values.toList()[index].title,
                    productId  : context.watch<CartViewProvider>().items.values.toList()[index].productId,
                    quantity   : context.watch<CartViewProvider>().items.values.toList()[index].quantity,
                 );
              }
          ),
        ),
           if(context.watch<CartViewProvider>().items.isNotEmpty)
            FormsText.showHomeScreenHeading('You should also buy this'), 
            if(context.watch<CartViewProvider>().items.isNotEmpty)
            Container(  
            height: 400,
            padding:const EdgeInsets.all(12.0),  
            child: GridView.builder(  
              physics: const ScrollPhysics(),
              itemCount: 
              context.watch<CatergoryProvider>().fashionitems.length,  
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: 2,  
                  crossAxisSpacing: 2.0,  
                  mainAxisSpacing: 2.0  
              ),  
              itemBuilder: ( context,  index){  
                return GridHomeWidget(
                      productId   : context.watch<CatergoryProvider>().fashionitems[index].productId,
                      description : context.watch<CatergoryProvider>().fashionitems[index].description,
                      image       : context.watch<CatergoryProvider>().fashionitems[index].imageurl,
                      price       : context.watch<CatergoryProvider>().fashionitems[index].price,
                      title       : context.watch<CatergoryProvider>().fashionitems[index].title,
                      rating      : context.watch<CatergoryProvider>().fashionitems[index].rating,
                      quantity    : context.watch<CatergoryProvider>().fashionitems[index].quantity,
                      
                );  
              },  
            )),            
        ],
      ),
    );
  }
}
