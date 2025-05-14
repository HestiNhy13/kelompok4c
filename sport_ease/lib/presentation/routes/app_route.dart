import 'package:flutter/material.dart';
import 'package:sport_ease/presentation/screens/profil_screen.dart';
import 'package:sport_ease/presentation/screens/reset_password_screen.dart';
import 'package:sport_ease/presentation/screens/riwayat_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/opening_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/home_screen.dart';

class AppRoute{
  static const String splash = '/splash';
  static const String opening = '/opening';
  static const String login = '/login';
  static const String register = '/register';
  static const String resetpassword = '/reset';
  static const String beranda = '/beranda';
  static const String daftar = '/pendaftaran';
  static const String riwayat = '/riwayat';
  static const String profile = '/profile';


  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case opening:
        return MaterialPageRoute(builder: (_) => OpeningScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case resetpassword:
        return MaterialPageRoute(builder: (_) => ResetPassword());
      case beranda:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case riwayat:
        return MaterialPageRoute(builder: (_) => RiwayatScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(child: Text('Halaman tidak ditemukan.'),),
        ));
    }
  }
}