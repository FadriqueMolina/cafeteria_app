import 'package:cafeteria_app/presentation/screens/information_screen.dart';
import 'package:cafeteria_app/presentation/screens/menu_screen.dart';
import 'package:cafeteria_app/presentation/screens/reservation_screen.dart';
import 'package:cafeteria_app/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';

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
