import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_ease/views/screens/register_screen.dart';
import 'package:sport_ease/views/screens/verifikasi_email_screen.dart';
import 'package:sport_ease/core/controllers/login_controller.dart';
import '../widget/custom_button.dart';
import '../widget/custom_card.dart';
import '../widget/custom_text.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool _isPasswordVisible = false;
  double _logoSize = 200;

  String? emailError;
  String? passwordError;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateLogoSize);
  }

  void _updateLogoSize() {
    double newSize = 200 - _scrollController.offset;
    if (newSize < 100) newSize = 100;
    if (newSize > 200) newSize = 200;
    setState(() {
      _logoSize = newSize;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateLogoSize);
    _scrollController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FA),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(height: _logoSize + 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomCard(
                    gradientColors: [
                      Color(0xFF89F7FE),
                      Color(0xFF66A6FF),
                    ],
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('SELAMAT DATANG',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              )),
                          SizedBox(height: 10),
                          Text('Masuk untuk melanjutkan',
                              style: TextStyle(fontSize: 16, color: Colors.black54)),
                          SizedBox(height: 20),
                          Text('Email',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              )),
                          SizedBox(height: 10),
                          CustomTextField(
                            hintText: 'Masukkan Email',
                            controller: emailController,
                            borderColor: Colors.black45,
                            fillColor: Color.fromARGB(255, 247, 245, 245),
                          ),
                          if (emailError != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0, left: 4),
                              child: Text(
                                emailError!,
                                style: TextStyle(color: Colors.red, fontSize: 12),
                              ),
                            ),
                          SizedBox(height: 15),
                          Text('Password',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              )),
                          SizedBox(height: 10),
                          CustomTextField(
                            hintText: 'Masukkan Password',
                            controller: passwordController,
                            obscureText: !_isPasswordVisible,
                            borderColor: Colors.black45,
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: Icon(_isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          if (passwordError != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0, left: 4),
                              child: Text(
                                passwordError!,
                                style: TextStyle(color: Colors.red, fontSize: 12),
                              ),
                            ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => ResetPassword()));
                              },
                              child: Text('Lupa Kata Sandi?',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      decoration: TextDecoration.underline)),
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: CustomButton(
                              text: 'Masuk',
                              color: Colors.blue.shade800,
                              textColor: Colors.white,
                              onPressed: () {
                                LoginController.handleLogin(
                                  context: context,
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  setEmailError: (error) => setState(() => emailError = error),
                                  setPasswordError: (error) => setState(() => passwordError = error),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(child: Text('atau', style: TextStyle(fontSize: 16))),
                          SizedBox(height: 20),
                          Center(
                            child: CustomButton(
                              text: 'Daftar',
                              color: Colors.white,
                              textColor: Colors.black,
                              borderColor: Colors.black87,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/image/logo1.png',
                width: _logoSize,
                height: _logoSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
