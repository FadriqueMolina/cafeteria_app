import 'package:cafeteria_app/screens/information_screen.dart';
import 'package:cafeteria_app/screens/menu_screen.dart';
import 'package:cafeteria_app/screens/reservation_screen.dart';
import 'package:cafeteria_app/screens/settings_screen.dart';
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
      backgroundColor: Colors.white, // Fondo blanco para combinar con el diseño
      body: _screenOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        onTap: _onTappedItem,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Reservas",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Informacion"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Configuracion",
          ),
        ],
      ),
    );
  }
}
