import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:sport_ease/presentation/screens/home_screen.dart';
import 'package:sport_ease/presentation/screens/reset_password_screen.dart';
import 'package:sport_ease/presentation/screens/register_screen.dart';
import '../../services/auth_service.dart';
import '../../models/user_model.dart';
import 'package:sport_ease/providers/user_provider.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text.dart';
import '../widget/custom_card.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  Future<void> handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    String? result = await AuthService().loginUser(email: email, password: password);

    if (result == null) {
      try {
        final uid = FirebaseAuth.instance.currentUser!.uid;

        final snapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();

        if (snapshot.exists) {
          final userData = snapshot.data()!;
          final user = UserModel.fromMap(userData);

          // Simpan ke provider
          context.read<UserProvider>().setUser(user);

          // Navigasi ke halaman beranda
          Navigator.pushReplacementNamed(context, '/beranda');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data pengguna tidak ditemukan di Firestore.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Terjadi kesalahan: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(child: Image.asset('assets/image/logo1.png', width: 300)),
            const SizedBox(height: 10),
            CustomCard(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('SELAMAT DATANG', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    const Text('Masuk untuk melanjutkan', style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 15),
                    const Text('Email', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Masukkan Email',
                      controller: emailController,
                      borderColor: Colors.black87,
                      fillColor: Colors.white60,
                    ),
                    const SizedBox(height: 10),
                    const Text('Password', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Masukkan Password',
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      borderColor: Colors.black87,
                      fillColor: Colors.white60,
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword()));
                        },
                        child: const Text('Lupa Kata Sandi?', style: TextStyle(color: Colors.black, decoration: TextDecoration.underline)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: CustomButton(
                        text: 'Masuk',
                        borderColor: Colors.black,
                        color: Colors.blue.shade900,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Center(child: Text('atau', style: TextStyle(fontSize: 16))),
                    const SizedBox(height: 15),
                    Center(
                      child: CustomButton(
                        text: 'Daftar',
                        color: Colors.white,
                        textColor: Colors.black,
                        borderColor: Colors.black,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
