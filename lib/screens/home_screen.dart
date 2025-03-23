import 'package:cafeteria_app/providers/auth_provider.dart';
import 'package:cafeteria_app/screens/information_screen.dart';
import 'package:cafeteria_app/screens/menu_screen.dart';
import 'package:cafeteria_app/screens/reservation_screen.dart';
import 'package:cafeteria_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screenOptions = [
    MenuScreen(),
    ReservationScreen(),
    InformationScreen(),
    SettingsScreen(),
  ];

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<AuthProvider>(
          builder:
              (context, authProvider, child) => Text(
                "Bienvenido, ${authProvider.userName}",
                style: TextStyle(
                  color: Colors.brown[100],
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        backgroundColor: Colors.brown[800],
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.amber),
            onPressed: () {
              // Lógica para notificaciones
            },
          ),
        ],
      ),
      body: _screenOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown[800], // Fondo marrón oscuro
        type: BottomNavigationBarType.fixed, // Tipo fijo para evitar problemas
        selectedItemColor: Colors.amber, // Ícono seleccionado en ámbar
        unselectedItemColor:
            Colors.brown[100], // Ícono no seleccionado en beige claro
        currentIndex: _selectedIndex,
        onTap: _onTappedItem,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menú"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Reservas",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Información"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Configuración",
          ),
        ],
      ),
    );
  }
}
