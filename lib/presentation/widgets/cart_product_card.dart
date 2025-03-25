import 'package:cafeteria_app/business/models/cart_item.dart';
import 'package:cafeteria_app/core/widgets/my_card_image.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback addItem;
  final VoidCallback removeItem;
  const CartProductCard({
    super.key,
    required this.cartItem,
    required this.addItem,
    required this.removeItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: MyCardImage(imageUrl: cartItem.product.imageUrl),
        title: Text(
          cartItem.product.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: addItem, icon: Icon(Icons.add)),
            Text(
              cartItem.quantity.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(onPressed: removeItem, icon: Icon(Icons.remove)),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  "Subtotal:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "\$${cartItem.product.price}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  "\$${cartItem.product.price * cartItem.quantity}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
