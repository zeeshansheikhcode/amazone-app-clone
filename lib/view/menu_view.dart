import 'package:amazonapp/commons/ui_helpers.dart';
import 'package:amazonapp/utils/routes/routes_name.dart';
import 'package:amazonapp/utils/utils.dart';
import 'package:amazonapp/viewmodel/authentication_viewmodel.dart';
import 'package:amazonapp/viewmodel/cart_viewmodel.dart';
import 'package:amazonapp/viewmodel/menu_viewmodel.dart';
import 'package:amazonapp/widgets/formtermstext.dart';
import 'package:amazonapp/widgets/searchbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../commons/app_strings.dart';
import '../widgets/menucontainer_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topLeft,
              end:   Alignment.bottomRight,
              stops: 
              [0.0,1.0,],
            colors: [Color.fromARGB(255, 89, 245, 245), Colors.white],
            )
        ),
      child: ListView(
        children:
        [
           verticalSpaceSmall,
           const SearchBar(containerwidth: false,),
           verticalSpaceSmall,
           
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: context.watch<MenuViewModel>().showDepart ? 250 : 50,
                width: double.infinity,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: 
                    [ if(!context.watch<MenuViewModel>().showDepart)
                     const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child:  Text('Shop by Department',style: heading1,),
                      ),
                      if(context.watch<MenuViewModel>().showDepart)
                       Expanded(
                         child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: 
                          [
                            ListTile(
                              title: Text(context.watch<MenuViewModel>().departmentName[0],style: heading1,),
                            ),
                            ListTile(
                              onTap: () {
                                  Navigator.pushNamed(context, RoutesName.showdepartment,arguments: 'Fashion');                     
                             
                              },
                              title: Text(context.watch<MenuViewModel>().departmentName[1],style: heading2,),
                            ),
                            ListTile(
                              onTap: (){
                               Navigator.pushNamed(context, RoutesName.showdepartment,arguments: 'Mobile');
                              },
                              title: Text(context.watch<MenuViewModel>().departmentName[2],style: heading2,),
                            ),
                            ListTile(
                              onTap: (){
                              Navigator.pushNamed(context, RoutesName.showdepartment,arguments: 'Sofa');
                              },
                              title: Text(context.watch<MenuViewModel>().departmentName[3],style: heading2,),
                            ),
                          ],
                         ),
                       ),
                      IconButton(
                        onPressed: ()
                        {   if(!context.read<MenuViewModel>().showDepart)
                            {
                              context.read<MenuViewModel>().updatedheight(true);
                            }
                            else 
                            {
                              context.read<MenuViewModel>().updatedheight(false);
                            }
                           
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                        )
                    ],
                  ),
                ),
              ),
            verticalSpaceSmall,
            const MenuContainer(title: 'Settings'),
            verticalSpaceSmall,
            const MenuContainer(title: 'Customer Services'),    
            verticalSpaceSmall,
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: double.infinity,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: 
                    [ 
                      Expanded(child: GestureDetector(
                        onTap: ()
                        {
                           context.read<AuthenticationViewModel>().loggingOut();
                           context.read<CartViewProvider>().clear();
                           Utils.showSnackBar('Successfully Log Out', context);
                           Navigator.pushReplacementNamed(context, RoutesName.authenicate);

                        },
                        child: const Text('Sign Out',style: heading1,))),
                      const Icon(Icons.arrow_forward_ios,size: 18,),
                    ],
                  ),
                ),
              ),
           
         ],
        ),
      ),
    );
  }
}