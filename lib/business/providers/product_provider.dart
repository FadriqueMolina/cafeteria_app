import 'package:cafeteria_app/business/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection("products").get();
      _products =
          snapshot.docs.map((doc) {
            return Product.fromFirestore(doc.data(), doc.id);
          }).toList();
    } catch (e) {
      throw Exception("Error al cargar la lista de productos: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
