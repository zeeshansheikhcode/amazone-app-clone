class CartItem
{
  
   String cartid;
   String title;
   int quantity;
   double price;
   String? productId;
   String? image;
   String? description;
   String? location;

  CartItem({
  required this.cartid,
  required this.title,
  required this.quantity,
  required this.price,
  required this.image,
  required this.description,
   this.location,
   this.productId
    });
}