import 'package:flutter/material.dart';
import 'package:sport_ease/presentation/screens/login_screen.dart';
import 'package:sport_ease/presentation/widget/custom_button.dart';
import '../widget/custom_card.dart';
import '../widget/custom_text.dart';
import '../../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  // final phoneController = TextEditingController();
  // final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  Future<void> handleRegister() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    // final phone = phoneController.text.trim();
    // final address = addressController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Semua field harus diisi.')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password dan konfirmasi tidak cocok.')),
      );
      return;
    }

    String? result = await AuthService().registerUser(
      name: name,
      email: email,
      // phone: phone,
      // address: address,
      password: password,
    );

    if (result == null) {
      _showSuccessDialog();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Pendaftaran Sukses"),
          content: const Text("Anda sukses registrasi. Silakan login."),
          actions: [
            CustomButton(
              text: 'Login',
              color: Colors.blue.shade900,
              borderColor: Colors.black,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(height: 30),
              CustomCard(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('REGISTER', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      const Text('Lengkapi data diri Anda!', style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 20),

                      const Text("Nama Lengkap"),
                      const SizedBox(height: 6),
                      CustomTextField(hintText: "Nama Lengkap", controller: nameController, borderColor: Colors.black, fillColor: Colors.white60),
                      const SizedBox(height: 12),

                      const Text("Email"),
                      const SizedBox(height: 6),
                      CustomTextField(hintText: "Email", controller: emailController, borderColor: Colors.black, fillColor: Colors.white60),
                      const SizedBox(height: 12),

                      // const Text("No. Telepon"),
                      // const SizedBox(height: 6),
                      // CustomTextField(hintText: "No. Telepon", controller: phoneController, borderColor: Colors.black, fillColor: Colors.white60),
                      // const SizedBox(height: 12),

                      // const Text("Alamat"),
                      // const SizedBox(height: 6),
                      // CustomTextField(hintText: "Alamat", controller: addressController, borderColor: Colors.black, fillColor: Colors.white60),
                      // const SizedBox(height: 12),

                      const Text("Password"),
                      const SizedBox(height: 6),
                      CustomTextField(
                        hintText: "Password",
                        controller: passwordController,
                        borderColor: Colors.black,
                        fillColor: Colors.white60,
                        obscureText: !_isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 12),

                      const Text("Konfirmasi Password"),
                      const SizedBox(height: 6),
                      CustomTextField(
                        hintText: "Konfirmasi Password",
                        controller: confirmPasswordController,
                        borderColor: Colors.black,
                        fillColor: Colors.white60,
                        obscureText: !_isConfirmPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(_isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
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
                          color: Colors.blue.shade900,
                          borderColor: Colors.black,
                          onPressed: handleRegister,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
