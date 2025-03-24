import 'package:cafeteria_app/providers/product_provider.dart';
import 'package:cafeteria_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

/*Crearemos un menu screen con una lista central que cargara los productos del provider de productos, los mostrara en una lista de cards con un listtile
Que llevara la informacion */
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          return productProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: productProvider.products.length,
                itemBuilder: (context, index) {
                  final product = productProvider.products[index];
                  print(product.imageUrl);
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: product.imageUrl,
                        width: 50, // Ancho deseado
                        height: 50, // Alto deseado
                        fit:
                            BoxFit
                                .cover, // Ajustar la imagen al espacio disponible
                        placeholder:
                            (context, url) =>
                                CircularProgressIndicator(), // Muestra un indicador de carga
                        errorWidget:
                            (context, url, error) => Icon(
                              Icons.error,
                            ), // Muestra un ícono de error si la imagen no se carga
                      ),
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "\$${product.price.toStringAsFixed(2)}",
                            style: TextStyle(color: Colors.brown[600]),
                          ),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.amber),
                            onPressed: () {
                              showGlobalSnackBar(
                                "Producto agregado al carrito",
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
        },
      ),
    );
  }
}
