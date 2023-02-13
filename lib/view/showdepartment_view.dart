import 'package:amazonapp/widgets/searchbar_widget.dart';
import 'package:amazonapp/widgets/seemore_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../commons/app_strings.dart';
import '../commons/ui_helpers.dart';
import '../viewmodel/category_viewmodel.dart';
class ShowDepartmentView extends StatelessWidget {
  const ShowDepartmentView({super.key});

  @override
  Widget build(BuildContext context) {
      final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      body: ListView(
        children: 
        [
           verticalSpaceSmall,
           Container(
            height: 70,
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
            child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const
                [
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 5),
                   child:  Icon(Icons.arrow_back),
                 ),
                 SearchBar(containerwidth: true,),
               
                ] 
               ),
           ),
           verticalSpaceRegular,
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Text(args,style: heading,),
            ),
            verticalSpaceRegular,
           const Padding(
             padding:  EdgeInsets.symmetric(horizontal: 20),
             child: Text('Available in good quality and price',style: heading2,),
            ),
           verticalSpaceRegular,
           ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context,index)
             {  
              if(args == 'Mobile')
                {
                   return SeeMoreWidget(
                       description : context.watch<CatergoryProvider>().mobileitems[index].description,
                        image      : context.watch<CatergoryProvider>().mobileitems[index].imageurl,
                        price      : context.watch<CatergoryProvider>().mobileitems[index].price,
                        title      : context.watch<CatergoryProvider>().mobileitems[index].title,
                        rating     : context.watch<CatergoryProvider>().mobileitems[index].rating,
                        quantity   : context.watch<CatergoryProvider>().mobileitems[index].quantity,
                  );
               }
                if(args== 'Fashion')
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
             }
            )

        ],
      ),
    );
  }
}