import 'package:amazonapp/model/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class CatergoryProvider with ChangeNotifier
{
  List<CategoryMobile>  mobileitems  = [];
  List<CategorySofa>    sofaitems    = [];
  List<CategoryFashion> fashionitems = [];
 
    Future<void> fetchAndSetMobile() async {
    try
    {
        final QuerySnapshot snapshot = await FirebaseFirestore.instance
       .collection("CategoryMobile")
       .get();  
      if(snapshot.docs == null)
      {
          return ;
      }
     final alllist = snapshot.docs.map((doc) => CategoryMobile.fromDocument(doc)).toList();
     mobileitems = alllist;
     
     notifyListeners();  
    }
    catch(e)
    {
       e.toString();
    }
    }
    Future<void> fetchAndSetSofa() async {
  
    try
    {
        final QuerySnapshot snapshot = await FirebaseFirestore.instance
       .collection("CategorySofa")
       .get(); 
      if(snapshot.docs == null)
      {
          return ;
      }
     final alllist = snapshot.docs.map((doc) => CategorySofa.fromDocument(doc)).toList();
     sofaitems = alllist;
   
     notifyListeners();  
    }
    catch(e)
    {
       e.toString();
    }

  }

  Future<void> fetchAndSetFashion() async {
  
    try
    {
        final QuerySnapshot snapshot = await FirebaseFirestore.instance
       .collection("CategoryFashion")
       .get(); 
      if(snapshot.docs == null)
      {
          return ;
      }
     final alllist = snapshot.docs.map((doc) => CategoryFashion.fromDocument(doc)).toList();
     fashionitems = alllist;
     
     notifyListeners();  
    }
    catch(e)
    {
       e.toString();
    }

  }  
}
