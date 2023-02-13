import 'package:amazonapp/commons/ui_helpers.dart';
import 'package:amazonapp/utils/utils.dart';
import 'package:amazonapp/viewmodel/delieveryaddress_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../commons/app_strings.dart';
class DelieveryAddress extends StatelessWidget {
  const DelieveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: 
          [
            verticalSpaceRegular,
            TextFormField(
                controller: context.watch<DeliveryAddressViewModel>().mycontroller,
                 onChanged: (value) 
                 {
                  context.read<DeliveryAddressViewModel>().onChanged();
                 },
                 decoration: InputDecoration(
                 enabledBorder:const OutlineInputBorder(
                 borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 86, 79, 79)), //<-- SEE HERE
                     ),
                 focusedBorder:const OutlineInputBorder(
                 borderSide: BorderSide(width: 3, color: Colors.amberAccent),
                 ),
                 disabledBorder: InputBorder.none,
                 filled: true, 
                 fillColor: Colors.grey.shade100,
                 ),    
              ),
            verticalSpaceSmall,
            GestureDetector(
              onTap: (() {
                 if(context.read<DeliveryAddressViewModel>().mycontroller.text.isEmpty)
                 {
                  Utils.showSnackBar('Enter Location', context);
                 }
                 else
                 {
                   Navigator.pop(context);
                 }
              }),
              child: Container(
                    height: 60,
                    width: 200,
                    decoration:  BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:const Center(child:  Text('Done',style: heading3,)),
                  ),
            ),
            verticalSpaceSmall,
           const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child:  Text('Choose Location:',style: heading,),
            ),
            verticalSpaceSmall,
                      ListView.builder(
                        physics:const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:context.watch<DeliveryAddressViewModel>().placeList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                            },
                            child: ListTile(
                              onTap: (() {
                                context.read<DeliveryAddressViewModel>().updatedlocation(
                                context.read<DeliveryAddressViewModel>().placeList[index]["description"]);
                                Utils.showSnackBar('Location Selected ', context);
                                Navigator.pop(context);
                              }),
                              title: Text(context.watch<DeliveryAddressViewModel>().placeList[index]["description"]),
                            ),
                          );
                        },
                      )

          ],
        ),
      ),
    );
  }
}