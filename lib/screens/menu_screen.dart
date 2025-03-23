import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.brown[50], // Fondo beige claro
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.coffee,
                size: 100,
                color: Colors.brown[800], // Ícono marrón oscuro
              ),
              SizedBox(height: 20),
              Text(
                "Sitio en construcción",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.brown[800], // Texto marrón oscuro
                ),
              ),
              SizedBox(height: 20),
              // Ejemplo de tarjeta de producto
              Card(
                elevation: 4, // Sombra
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  leading: Icon(Icons.coffee, color: Colors.brown[800]),
                  title: Text(
                    "Café Americano",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[800],
                    ),
                  ),
                  subtitle: Text(
                    "\$2.50",
                    style: TextStyle(color: Colors.brown[600]),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.add, color: Colors.amber),
                    onPressed: () {
                      // Lógica para agregar al carrito
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
