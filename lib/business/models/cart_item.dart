import 'package:cafeteria_app/business/models/product.dart';

class CartItem {
  final Product product;
  int _quantity = 1;

  CartItem({required this.product});

  int get quantity => _quantity;

  void increaseQuantity() {
    _quantity++;
  }

  void decreaseQuantity() {
    _quantity--;
  }
}
