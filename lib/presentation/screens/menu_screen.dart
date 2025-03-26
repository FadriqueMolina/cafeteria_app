import 'package:cafeteria_app/business/providers/cart_provider.dart';
import 'package:cafeteria_app/business/providers/product_provider.dart';
import 'package:cafeteria_app/core/utils/helpers.dart';
import 'package:cafeteria_app/presentation/screens/cart_screen.dart';
import 'package:cafeteria_app/presentation/widgets/cart_custom_icon.dart';
import 'package:cafeteria_app/presentation/widgets/menu_product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        actions: [
          CartCustomIcon(
            action: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
        backgroundColor: Colors.brown[800],
        title: Text(
          "Menu",
          style: TextStyle(
            color: Colors.brown[100],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          return productProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: productProvider.products.length,
                itemBuilder: (context, index) {
                  final product = productProvider.products[index];
                  return MenuProductCard(
                    product: product,
                    addButtonAction: () {
                      cartProvider.addToCart(product);
                      showGlobalSnackBar(
                        "Producto ${product.name} agregado al carrito",
                      );
                    },
                  );
                },
              );
        },
      ),
    );
  }
}
