import 'package:flutter/material.dart';
import 'package:sport_ease/views/screens/login_screen.dart';

class OpeningController {
  static void handleStartButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
