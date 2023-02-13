import 'package:amazonapp/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import '../model/cart_model.dart';

class CartViewProvider with ChangeNotifier{
  Map<String,CartItem> _items = {};
  Map<String,CartItem> get items {
    return {..._items};
  }
  bool once =true;
  double subtotal =0;
  int _counter = 0;
  int quantityvalue = 1  ;
  setOnce()
  {
    once = false;
    notifyListeners();
  }
   updateQuantity()
  { 
     if(quantityvalue<=10)
     {
      quantityvalue = quantityvalue+1;
      notifyListeners();
     }
  }
 
  int get itemCount {
 
    return _counter;
  }
 //Adding Item to Cart function
  void addItem(
    String productId,double price,
    String title,String description,
    String image,int rating,int quant,
    String location,BuildContext context)
  {  
    if(_items.containsKey(productId))
     {

      Utils.showSnackBar('Item Already Added', context);
     }
     else
     {
       _items.putIfAbsent(
         productId,
          () => CartItem(
          cartid: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: quant,
          image:image ,
          description: description,
          productId: productId,
          location: location,
        )
       );
       subtotal+=price;
        _counter++;
      }
     
     notifyListeners();
  }
  //Adding Item to Cart function
  void removeItem(String productId)
  {
    _items.remove(productId);
    notifyListeners();
  }
  //Clear Cart function
  void clear() {
    _items = {};
    _counter =0;
    subtotal =0;
    notifyListeners();
  }
}
