import 'package:flutter/material.dart';

const String ksHomeBottomSheetTitle = 'Build Great Apps!';
const String ksHomeBottomSheetDescription =
    'Stacked is built to help you build better apps. Give us a chance and we\'ll prove it to you. Check out stacked.filledstacks.com to learn more';
const TextStyle heading = TextStyle(
    fontFamily: 'EmberMedium',
    fontSize: 22,
    fontWeight: FontWeight.bold,
);
const TextStyle heading1 = TextStyle(
    fontFamily: 'EmberMedium',
    fontSize: 18,
   // fontWeight: FontWeight.bold,
);
const TextStyle heading2 = TextStyle(
    fontFamily: 'EmberLight',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis 
);

const TextStyle heading3 = TextStyle(
    fontFamily: 'EmberMedium',
    fontSize: 18,
    overflow: TextOverflow.ellipsis 
);
const TextStyle heading4 = TextStyle(
    fontFamily: 'EmberLight',
    fontSize: 18,
    overflow: TextOverflow.ellipsis 
);
TextStyle myStyle(double size,[Color? color,FontWeight fw = FontWeight.w700])
  {
    return TextStyle(
     fontSize: size,
     fontWeight:  fw,
     color: color,
   );
  }

