import 'package:cafeteria_app/business/models/product.dart';
import 'package:cafeteria_app/core/widgets/my_card_image.dart';
import 'package:flutter/material.dart';

class MenuProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback addButtonAction;

  const MenuProductCard({
    super.key,
    required this.product,
    required this.addButtonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: MyCardImage(imageUrl: product.imageUrl),
        title: Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(product.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "\$${product.price.toStringAsFixed(2)}",
              style: TextStyle(color: Colors.brown[600]),
            ),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.amber),
              onPressed: addButtonAction,
            ),
          ],
        ),
      ),
    );
  }
}
