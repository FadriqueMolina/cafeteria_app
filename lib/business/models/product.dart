class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  final String imageUrl; // URL de la imagen

  Product._({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    this.imageUrl = "",
  });

  factory Product.fromFirestore(Map<String, dynamic> data, String id) {
    return Product._(
      id: id,
      name: data["name"] ?? "",
      price: data["price"] != null ? (data["price"] as num).toDouble() : 0.0,
      description: data["description"] ?? "",
      imageUrl:
          data['imageUrl'] ??
          "https://upload.wikimedia.org/wikipedia/commons/f/f7/Linea_doubleespresso.jpg", // Imagen por defecto
    );
  }
}
