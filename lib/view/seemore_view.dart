import 'package:amazonapp/commons/ui_helpers.dart';
import 'package:amazonapp/widgets/searchbar_widget.dart';
import 'package:amazonapp/widgets/seemore_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../commons/app_strings.dart';
import '../viewmodel/category_viewmodel.dart';
class SeeMore extends StatelessWidget {
  const SeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: 
          [  verticalSpaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const
              [
               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 5),
                 child:  Icon(Icons.arrow_back),
               ),
              
               SearchBar(containerwidth: true)
              ] 
             ),
             verticalSpaceSmall,
             ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true, 
              physics:const ScrollPhysics(),
              itemCount: 4,
              itemBuilder: ((context, index) {
              if(args == 'Mobile')
              {
                 return SeeMoreWidget(
                      productId    : context.watch<CatergoryProvider>().mobileitems[index].productId,
                       description : context.watch<CatergoryProvider>().mobileitems[index].description,
                        image      : context.watch<CatergoryProvider>().mobileitems[index].imageurl,
                        price      : context.watch<CatergoryProvider>().mobileitems[index].price,
                        title      : context.watch<CatergoryProvider>().mobileitems[index].title,
                        rating     : context.watch<CatergoryProvider>().mobileitems[index].rating,
                        quantity   : context.watch<CatergoryProvider>().mobileitems[index].quantity,
                  );
              }
              if(args == 'Fashion')
              {
                 return SeeMoreWidget(
                       description : context.watch<CatergoryProvider>().fashionitems[index].description,
                        image      : context.watch<CatergoryProvider>().fashionitems[index].imageurl,
                        price      : context.watch<CatergoryProvider>().fashionitems[index].price,
                        title      : context.watch<CatergoryProvider>().fashionitems[index].title,
                        rating     : context.watch<CatergoryProvider>().fashionitems[index].rating,
                        quantity   : context.watch<CatergoryProvider>().fashionitems[index].quantity,
                  );
              }
              if(args== 'Sofa')
              {
                 return SeeMoreWidget(
                       description : context.watch<CatergoryProvider>().sofaitems[index].description,
                        image      : context.watch<CatergoryProvider>().sofaitems[index].imageurl,
                        price      : context.watch<CatergoryProvider>().sofaitems[index].price,
                        title      : context.watch<CatergoryProvider>().sofaitems[index].title,
                        rating     : context.watch<CatergoryProvider>().sofaitems[index].rating,
                        quantity   : context.watch<CatergoryProvider>().sofaitems[index].quantity,
                  );

              }
              return const SizedBox();
              
             
                }))
            ],
          ),
       ),
    );
  }
}