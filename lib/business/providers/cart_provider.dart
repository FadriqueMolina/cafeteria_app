import 'package:cafeteria_app/business/models/cart_item.dart';
import 'package:cafeteria_app/business/models/product.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _cartItems = {};

  List<CartItem> get cartItems => _cartItems.values.toList();
  double get total =>
      _cartItems.values.fold<double>(0, (acum, toAdd) => acum + toAdd.subTotal);

  void addToCart(Product product) {
    String id = product.id;

    if (_cartItems.isEmpty || _cartItems[id] == null) {
      _cartItems[id] = CartItem(product: product);
    } else {
      _cartItems[id]?.increaseQuantity();
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    if (!_cartItems.containsKey(productId)) {
      return;
    }

    if (_cartItems[productId]?.quantity == 1) {
      _cartItems.remove(productId);
    } else {
      _cartItems[productId]?.decreaseQuantity();
    }

    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
