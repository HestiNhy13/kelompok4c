import 'package:flutter/material.dart';
import 'package:sport_ease/views/screens/pendaftaran_screen.dart';
import 'package:sport_ease/views/screens/riwayat_screen.dart';
import 'package:sport_ease/views/screens/profil_screen.dart';
import '../widget/custom_navbar.dart';
import 'package:sport_ease/core/controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeController.buildBeranda(context), // dipanggil dari controller
      const PendaftaranScreen(),
      const RiwayatScreen(),
      ProfilScreen(),
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavbar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTap,
      ),
    );
  }
}
