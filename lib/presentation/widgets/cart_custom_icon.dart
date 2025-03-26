import 'package:cafeteria_app/business/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCustomIcon extends StatelessWidget {
  final VoidCallback action;
  const CartCustomIcon({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.amber),
              onPressed: action,
            ),
            if (cartProvider.cartItems.isNotEmpty)
              Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  radius: 10,
                  child: Text(cartProvider.cartItems.length.toString()),
                ),
              ),
          ],
        );
      },
    );
  }
}
