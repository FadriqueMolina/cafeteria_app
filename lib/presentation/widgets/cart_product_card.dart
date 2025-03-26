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
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: MyCardImage(imageUrl: cartItem.product.imageUrl),
        title: Center(
          child: Text(
            cartItem.product.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: addItem,
                icon: const Icon(Icons.add, color: Colors.amber),
              ),
              Text(
                cartItem.quantity.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: removeItem,
                icon: const Icon(Icons.remove, color: Colors.amber),
              ),
            ],
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "\$${cartItem.product.price.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              "\$${cartItem.subTotal.toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
