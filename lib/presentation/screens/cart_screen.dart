import 'package:cafeteria_app/business/providers/cart_provider.dart';
import 'package:cafeteria_app/presentation/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carrito de compras"), centerTitle: true),

      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return cartProvider.cartItems.isEmpty
              ? Center(
                child: Text(
                  "Carrito vacio",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )
              : Center(
                child: ListView.builder(
                  itemCount: cartProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartProvider.cartItems[index];
                    return CartProductCard(
                      cartItem: cartItem,
                      addItem: () {
                        cartProvider.addToCart(cartItem.product);
                      },
                      removeItem: () {
                        cartProvider.removeFromCart(cartItem.product.id);
                      },
                    );
                  },
                ),
              );
        },
      ),
    );
  }
}
