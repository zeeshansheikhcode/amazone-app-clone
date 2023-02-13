import 'package:cloud_firestore/cloud_firestore.dart';

// Model  To Show Item in Widgets
class CategoryModel
{

   String productId;
   String title;
   double price;
   String description;
   String imageurl;
   double rating;
   double quantity;
  

  
  CategoryModel(
    {
      required this.productId,
     required this.title,
     required this.price,  
     required this.description, 
     required this.imageurl,
     required this.quantity,
     required this.rating,
    });
}

// Model One
class CategoryMobile 
{

   String productId;
   String title;
   double price;
   String description;
   String imageurl;
   double rating;
   double quantity;
  

  
  CategoryMobile(
    {
      required this.productId,
     required this.title,
     required this.price,  
     required this.description, 
     required this.imageurl,
     required this.quantity,
     required this.rating,
    });
    
    factory CategoryMobile.fromDocument(QueryDocumentSnapshot doc) {
    return CategoryMobile(
      productId    :        doc["productId"],
      title        :        doc["title"], 
      price        :        (doc["price"]as num).toDouble(), 
      description  :        doc["description"],
      imageurl     :        doc["imageurl"],
      quantity     :        (doc["quantity"]as num).toDouble(), 
      rating       :        (doc["rating"]as num).toDouble(), 
    );
  }
}
// Model Two
class CategorySofa 
{

   String productId;
   String title;
   double price;
   String description;
   String imageurl;
   double rating;
   double quantity;
  

  
  CategorySofa(
    { required this.productId,
     required this.title,
     required this.price,  
     required this.description, 
     required this.imageurl,
     required this.quantity,
     required this.rating,
    });
    
    factory CategorySofa.fromDocument(QueryDocumentSnapshot doc) {
    return CategorySofa(
      productId    :       doc["productId"] ,
      title        :        doc["title"], 
      price        :        (doc["price"]as num).toDouble(), 
      description  :        doc["description"],
      imageurl     :        doc["imageurl"],
      quantity     :        (doc["quantity"] as num).toDouble(), 
      rating       :        (doc["rating"] as num).toDouble(), 
    );
  }
}
// Model Three
class CategoryFashion 
{

   String productId;
   String title;
   double price;
   String description;
   String imageurl;
   double    rating;
   double quantity; 
  CategoryFashion(
    { required this.productId,
     required this.title,
     required this.price,  
     required this.description, 
     required this.imageurl,
     required this.quantity,
     required this.rating,
    });
    
    factory CategoryFashion.fromDocument(QueryDocumentSnapshot doc) {
    return CategoryFashion(
      productId    :        doc["productId"],
      title        :        doc["title"], 
      price        :        (doc["price"] as num).toDouble() , 
      description  :        doc["description"],
      imageurl     :        doc["imageurl"],
      quantity     :        (doc["quantity"] as num).toDouble(),
      rating       :        (doc["rating"] as num).toDouble(),
    );
  }
}