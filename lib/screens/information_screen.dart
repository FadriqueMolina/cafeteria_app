import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información"),
        backgroundColor: Colors.blue, // Color del AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info,
              size: 100,
              color: Colors.orange,
            ), // Ícono de información
            SizedBox(height: 20),
            Text(
              "Sitio en construcción",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
