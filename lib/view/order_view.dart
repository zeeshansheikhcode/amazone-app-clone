import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../commons/app_strings.dart';
import '../commons/ui_helpers.dart';
import '../viewmodel/order_viewmodel.dart';
import '../widgets/ordersbuttons_widget.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: FutureBuilder(
        future: context.read<OrderViewModel>().getUserName(),
        builder : (context,index) 
        {
          return  ListView(
          children: 
          [
             Container(
              height: 120,
              decoration: const BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
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
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: 
                            [             
                            SizedBox(
                             height: 30,
                             child: Image.asset('assets/images/amazon.png'),
                             ),
                             Row(
                               children: [
                               const  Icon(Icons.notifications,color: Colors.black,size: 25,),
                                 IconButton(
                                 onPressed: (){},
                                 icon:const Icon(Icons.search,color: Colors.black,size: 25,),
                                 ),
                               ],
                             ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpaceSmall,
                      Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: 
                  [
                     Text('Hello,${context.watch<OrderViewModel>().username}',style: heading,),
                    const CircleAvatar(
                      backgroundColor: Color.fromARGB(149, 158, 158, 158),
                      child: Icon(Icons.person_outline,color: Colors.white,),)
                  ],
                ),
              ),
            ),
                      
             ],
            ),
          ),
            verticalSpaceMedium,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  const
                [
                 OrdersButtonsOption(buttonTitle: 'Your Orders'),
                 horizontalSpaceSmall,
                 OrdersButtonsOption(buttonTitle: 'Buy Again'), 
                ],
              ),
            ),
            verticalSpaceSmall,
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  const
                [
                 OrdersButtonsOption(buttonTitle: 'Your Account'),
                 horizontalSpaceSmall,
                 OrdersButtonsOption(buttonTitle: 'Your Lists'),
                 
                ],
              ),
            ),
            verticalSpaceSmall,
          const Padding(
             padding:  EdgeInsets.symmetric(horizontal: 10),
             child:  Align(
                alignment: Alignment.topLeft,
                child: Text('Your Orders',style: heading,),
              ),
           ), 
             verticalSpaceSmall,
          const Padding(
             padding:  EdgeInsets.symmetric(horizontal: 10),
             child:  Align(
                alignment: Alignment.topLeft,
                child: Text('Hi,you have no recent order', style: heading4,),
              ),
           ),
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: (() {
                 
                }),
                child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                 child:const Center(child:  Text('Return to the Homepage',style:heading3)),
                ),
              ),
            ),
            verticalSpaceSmall,
          const Padding(
             padding:  EdgeInsets.symmetric(horizontal: 10),
             child:  Divider(
                color: Colors.grey,
                thickness: 5,
              ),
           ),
            const Padding(
               padding:  EdgeInsets.symmetric(horizontal: 10),
               child:  Align(
                alignment: Alignment.topLeft,
                child: Text('Your Lists',style: heading,),
            ),
             ), 
             verticalSpaceSmall,
           const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('You haven\'t created any lists.', style: heading4),
              ),
            ),
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: (() {
             
                }),
                child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                 child:const Center(child:  Text('Create a List',style: heading3,)),
                ),
              ),
            ),
            verticalSpaceSmall,
            const Padding(
             padding:  EdgeInsets.symmetric(horizontal: 10),
             child:  Divider(
                color: Colors.grey,
                thickness: 5,
              ),
           ),
          ],
        );
        }
      ),
    );
  }
}
