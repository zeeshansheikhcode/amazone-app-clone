import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/bottomnavigation_viewmodel.dart';
class BottomNavigationVIew extends StatelessWidget {
  const BottomNavigationVIew({super.key}); 
  @override
  Widget build(BuildContext context) { 
   return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
       backgroundColor: Colors.white,
       selectedItemColor: Colors.black,    
        unselectedItemColor: Colors.black,
        currentIndex: context.watch<BottomNavigatorProvider>().page,
        onTap: (index){
          context.read<BottomNavigatorProvider>().updatePage(index);
        },
        type: BottomNavigationBarType.fixed,
        items: 
       const  
       [    
            BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.home,size:24,),
            ),
            BottomNavigationBarItem(
              label: "",
            icon: Icon(Icons.person,size:24,),
            ),
            BottomNavigationBarItem(
              label: "",
            icon: Icon(Icons.shopping_cart,size:24,),
            ),
             BottomNavigationBarItem(
              label: "",
            icon: Icon(Icons.menu,size:24,)
            ),
        ]),
       body: IndexedStack(
            index: context.watch<BottomNavigatorProvider>().page,
              children: [
              context.watch<BottomNavigatorProvider>().pageoptions[0],
              context.watch<BottomNavigatorProvider>().pageoptions[1],
              context.watch<BottomNavigatorProvider>().pageoptions[2],
              context.watch<BottomNavigatorProvider>().pageoptions[3],  
              ],
           ),
         
    );
  }
 
}
