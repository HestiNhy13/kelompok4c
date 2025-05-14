import 'package:flutter/material.dart';
import 'package:sport_ease/core/controllers/register_controller.dart';
import 'package:sport_ease/views/screens/login_screen.dart';
import 'package:sport_ease/views/widget/custom_button.dart';
import 'package:sport_ease/views/widget/custom_card.dart';
import 'package:sport_ease/views/widget/custom_text.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final ScrollController _scrollController = ScrollController();
  double _logoSize = 200;

  late RegisterController _registerController;

  @override
  void initState() {
    super.initState();
    _registerController = RegisterController(context);
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
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
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
                      const Color(0xFF89F7FE),
                      const Color(0xFF66A6FF),
                    ],
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'DAFTAR AKUN',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Masukkan email dan password untuk mendaftar',
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          const SizedBox(height: 20),

                          const Text('Email'),
                          const SizedBox(height: 6),
                          CustomTextField(
                            hintText: "Email",
                            controller: emailController,
                            borderColor: Colors.black45,
                            fillColor: Colors.white,
                          ),
                          const SizedBox(height: 12),

                          const Text('Password'),
                          const SizedBox(height: 6),
                          CustomTextField(
                            hintText: "Password",
                            controller: passwordController,
                            obscureText: !_isPasswordVisible,
                            borderColor: Colors.black45,
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 12),

                          const Text('Konfirmasi Password'),
                          const SizedBox(height: 6),
                          CustomTextField(
                            hintText: "Konfirmasi Password",
                            controller: confirmPasswordController,
                            obscureText: !_isConfirmPasswordVisible,
                            borderColor: Colors.black45,
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isConfirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 24),

                          Center(
                            child: CustomButton(
                              text: 'DAFTAR',
                              color: Colors.blue.shade800,
                              textColor: Colors.white,
                              onPressed: () {
                                _registerController.handleRegister(
                                  emailController.text,
                                  passwordController.text,
                                  confirmPasswordController.text,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => LoginScreen()));
              },
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
