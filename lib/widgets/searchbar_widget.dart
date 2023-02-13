import 'package:flutter/material.dart';

import '../commons/app_strings.dart';
import '../commons/ui_helpers.dart';
class SearchBar extends StatelessWidget {
 final bool containerwidth;
 const SearchBar({super.key,required this.containerwidth});

  @override
  Widget build(BuildContext context) {
    return Container(
                   margin: const EdgeInsets.symmetric(horizontal: 10),
                   height: 50,
                   width: containerwidth == true ? 280 : double.infinity ,
                   decoration:  BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(5),
                   border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const
                  [
                     Icon(Icons.search), 
                     horizontalSpaceTiny,
                     Expanded(child: Text('Search on Amazon',style: heading2,)),
                     Icon(Icons.qr_code_scanner),
                     horizontalSpaceTiny,
                     Icon(Icons.mic_none_sharp),
                  ],
                ),
              ),
            );
  }
}