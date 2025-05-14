import 'package:flutter/material.dart';
import 'package:sport_ease/presentation/screens/otp_screen.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text.dart';
import '../widget/custom_textcontroller.dart';
import 'login_screen.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB2E0F7), // Biru muda di atas
              Colors.white // Putih di bawah
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),

              // Gambar dari assets
              Center(
                child: Image.asset(
                  'assets/image/ps1.png', // Ganti dengan path gambar 
                  height: 250,
                ),
              ),
              const SizedBox(height: 30),

              // Text: Lupa Kata Sandi
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Lupa Kata Sandi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Text: Silahkan masukkan email anda
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Silahkan Masukkan Email Anda \nadmin@gmail.com',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),),
              
              // Custom TextField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: CustomTextField(
                  hintText: 'Masukkan Email',
                  controller: emailController,
                  borderColor: Colors.black,
                  
                ),
              ),
              SizedBox(height: 10),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row( 
                children: [
                  const Text('Ingat kata sandi ? '),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()),);
                  }, 
                  child: const Text("masuk disini",
                  style: TextStyle(fontSize: 12, decorationColor: Colors.blue, decoration: TextDecoration.underline)))
                ],
              ),),
              const SizedBox(height: 20),
              Center(
                child: CustomButton(
                  text: 'Atur ulang kata sandi',
                  color: Colors.blue.shade900,
                  borderColor: Colors.black,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => OtpScreen()),);
                  },

                ),
              ),
              
              // Custom Button
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
              //   child: CustomButton(
              //     text: 'Atur Ulang Kata Sandi',
              //     borderColor: Colors.black,
              //     onPressed: () {
              //       // Aksi saat tombol ditekan
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
