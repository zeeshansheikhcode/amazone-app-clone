import 'package:amazonapp/widgets/formtermstext.dart';
import 'package:amazonapp/widgets/gridhomewidget.dart';
import 'package:amazonapp/utils/routes/routes_name.dart';
import 'package:amazonapp/widgets/searchbar_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../commons/app_strings.dart';
import '../commons/ui_helpers.dart';
import '../viewmodel/home_viewmodel.dart';
import '../viewmodel/category_viewmodel.dart';
import '../widgets/homelistview_widget.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        child: ListView(
           children: 
           [ 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  
              [
                IconButton(onPressed: (){}, 
                icon:const Icon(Icons.menu)),
                horizontalSpaceTiny,
                SizedBox(
                 height: 30,
                 child: Image.asset('assets/images/amazon.png'),
                  ),
                horizontalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:const 
                  [
                     Icon(Icons.location_on,color: Colors.black,),
                     Text('Pakistan'),
                  ],
                ),
                
                
              ],
            ),
            verticalSpaceRegular,
            const SearchBar(containerwidth: false,),
            verticalSpaceSmall,
             CarouselSlider(
                    options: CarouselOptions(
                          height: 220, 
                          autoPlay: true, 
                          enlargeCenterPage: true
                          ),
                      items: context.watch<HomeViewModel>().carouselItems.map((instance) 
                      {
                        return Builder(builder: (BuildContext context) 
                        {
                            return instance;       
                        });
                  }).toList(),
               ),
            verticalSpaceSmall,
         
          FormsText.showHomeScreenHeading('Popular'),  
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              child: SizedBox(
                height: 230,
                child: ListView.builder(
                  itemCount: context.watch<CatergoryProvider>().mobileitems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return  HomeWidget(
                      productId  : context.watch<CatergoryProvider>().mobileitems[index].productId,
                      description: context.watch<CatergoryProvider>().mobileitems[index].description,
                      image      : context.watch<CatergoryProvider>().mobileitems[index].imageurl,
                      price      : context.watch<CatergoryProvider>().mobileitems[index].price,
                      title      : context.watch<CatergoryProvider>().mobileitems[index].title,
                      rating     : context.watch<CatergoryProvider>().mobileitems[index].rating,
                      quantity   : context.watch<CatergoryProvider>().mobileitems[index].quantity,
                      
                      );
                    
                  }),        
                ),
              ),
            ),
            GestureDetector(
              onTap: (() {

                Navigator.pushNamed(context, RoutesName.seemore, 
                 arguments: 'Mobile'
                 );

              }),
              child: const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child:  Text('See More',style: heading3,)
               ),
            ),
            FormsText.showHomeScreenHeading('Mobiles'), 
            Container(  
            height: 350,
            padding:const EdgeInsets.all(12.0),  
            child: GridView.builder(  
              physics: const ScrollPhysics(),
              itemCount: context.watch<CatergoryProvider>().mobileitems.length,  
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: 2,  
                  crossAxisSpacing: 2.0,  
                  mainAxisSpacing: 2.0  
              ),  
              itemBuilder: ( context,  index){  
                return GridHomeWidget(
                       productId: context.watch<CatergoryProvider>().mobileitems[index].productId,
                      description: context.watch<CatergoryProvider>().mobileitems[index].description,
                      image      : context.watch<CatergoryProvider>().mobileitems[index].imageurl,
                      price      : context.watch<CatergoryProvider>().mobileitems[index].price,
                      title      : context.watch<CatergoryProvider>().mobileitems[index].title,
                      rating     : context.watch<CatergoryProvider>().mobileitems[index].rating,
                      quantity   : context.watch<CatergoryProvider>().mobileitems[index].quantity,
                      
                );
                  
              },  
            )), 
           GestureDetector(
              onTap: (() {
                Navigator.pushNamed(context, RoutesName.seemore, 
                 arguments: 'Mobile'
                 );
              }),
              child: const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child:  Text('See More',style: heading3,)
               ),
            ),
            FormsText.showHomeScreenHeading('More Items'), 
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              child: SizedBox(
                height: 230,
                child: ListView.builder(
                  itemCount: context.watch<CatergoryProvider>().sofaitems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return  HomeWidget(
                      productId  : context.watch<CatergoryProvider>().sofaitems[index].productId,
                      description: context.watch<CatergoryProvider>().sofaitems[index].description,
                      image      : context.watch<CatergoryProvider>().sofaitems[index].imageurl,
                      price      : context.watch<CatergoryProvider>().sofaitems[index].price,
                      title      : context.watch<CatergoryProvider>().sofaitems[index].title,
                      rating     : context.watch<CatergoryProvider>().sofaitems[index].rating,
                      quantity   : context.watch<CatergoryProvider>().sofaitems[index].quantity,
                      
                      );
                  }),        
                ),
              ),
            ),

            GestureDetector(
              onTap: (() {
                Navigator.pushNamed(context, RoutesName.seemore, 
                 arguments: 'Sofa'
                 );
              }),
              child: const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child:  Text('See More',style: heading3,)
               ),
            ),
            FormsText.showHomeScreenHeading('Fashion'), 
            
            Container(  
            height: 350,
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
                        productId: context.watch<CatergoryProvider>().fashionitems[index].productId,
                      description: context.watch<CatergoryProvider>().fashionitems[index].description,
                      image      : context.watch<CatergoryProvider>().fashionitems[index].imageurl,
                      price      : context.watch<CatergoryProvider>().fashionitems[index].price,
                      title      : context.watch<CatergoryProvider>().fashionitems[index].title,
                      rating     : context.watch<CatergoryProvider>().fashionitems[index].rating,
                      quantity   : context.watch<CatergoryProvider>().fashionitems[index].quantity,
                      
                );  
              },  
            )), 

            GestureDetector(
              onTap: (() {
                Navigator.pushNamed(context, RoutesName.seemore, 
                 arguments: 'Fashion'
                 );
              }),
              child: const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child:  Text('See More',style: heading3,)
               ),
            ),
             horizontalSpaceSmall,
             FormsText.showHomeScreenHeading('Sofa'), 
            
            Container(  
            height: 350,
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
                      productId: context.watch<CatergoryProvider>().sofaitems[index].productId,
                      description: context.watch<CatergoryProvider>().sofaitems[index].description,
                      image      : context.watch<CatergoryProvider>().sofaitems[index].imageurl,
                      price      : context.watch<CatergoryProvider>().sofaitems[index].price,
                      title      : context.watch<CatergoryProvider>().sofaitems[index].title,
                      rating     : context.watch<CatergoryProvider>().sofaitems[index].rating,
                      quantity   : context.watch<CatergoryProvider>().sofaitems[index].quantity,
                      
                );  
              },  
            )),
            GestureDetector(
              onTap: (() {
                Navigator.pushNamed(context, RoutesName.seemore, 
                 arguments: 'Sofa'
                 );
              }),
              child: const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child:  Text('See More',style: heading3,)
               ),
            ),
            FormsText.showHomeScreenHeading('Latest '), 
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              child: SizedBox(
                height: 230,
                child: ListView.builder(
                  itemCount: context.watch<CatergoryProvider>().fashionitems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return  HomeWidget(
                      productId  : context.watch<CatergoryProvider>().fashionitems[index].productId,
                      description: context.watch<CatergoryProvider>().fashionitems[index].description,
                      image      : context.watch<CatergoryProvider>().fashionitems[index].imageurl,
                      price      : context.watch<CatergoryProvider>().fashionitems[index].price,
                      title      : context.watch<CatergoryProvider>().fashionitems[index].title,
                      rating     : context.watch<CatergoryProvider>().fashionitems[index].rating,
                      quantity   : context.watch<CatergoryProvider>().fashionitems[index].quantity, 
                      );
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
