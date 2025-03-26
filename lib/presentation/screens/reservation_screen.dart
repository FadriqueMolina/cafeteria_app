import 'package:flutter/material.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reservas"),
        backgroundColor: Colors.blue, // Color del AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.calendar_today,
              size: 100,
              color: Colors.green,
            ), // Ícono de calendario
            const SizedBox(height: 20),
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
