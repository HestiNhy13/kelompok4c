import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:sport_ease/views/screens/login_screen.dart';

class RegisterController {
  final BuildContext context;

  RegisterController(this.context);

  void handleRegister(String email, String password, String confirmPassword) async {
    email = email.trim();
    password = password.trim();
    confirmPassword = confirmPassword.trim();

    // Validasi input
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showSnackbar('Semua field harus diisi.');
      return;
    }

    if (!email.endsWith('@gmail.com')) {
      _showPopup('Email harus menggunakan @gmail.com');
      return;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
      _showSnackbar('Masukkan email yang valid.');
      return;
    }

    if (!RegExp(r'^[a-z0-9]{8,}$').hasMatch(password)) {
      _showPopup('Password hanya boleh berisi huruf kecil dan angka, minimal 8 karakter.');
      return;
    }

    if (password != confirmPassword) {
      _showSnackbar('Password dan konfirmasi tidak cocok.');
      return;
    }

    try {
      // Buat akun Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      if (user != null) {
        // Simpan data tambahan ke Firestore
        try {
          await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'uid': user.uid,
            'email': user.email,
            'createdAt': Timestamp.now(),
          });

          // Tampilkan dialog sukses
          _showSuccessDialog();
        } catch (firestoreError) {
          print('Firestore error: $firestoreError');
          _showSnackbar('Gagal menyimpan data ke Firestore.');
        }
      }
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth error: ${e.code} - ${e.message}');
      String errorMsg = _firebaseAuthErrorMessage(e.code);
      _showSnackbar(errorMsg);
    } catch (e) {
      print('Unexpected error: $e');
      _showSnackbar('Terjadi kesalahan yang tidak diketahui.');
    }
  }

  String _firebaseAuthErrorMessage(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Email sudah terdaftar. Silakan gunakan email lain.';
      case 'invalid-email':
        return 'Format email tidak valid.';
      case 'weak-password':
        return 'Password terlalu lemah.';
      default:
        return 'Terjadi kesalahan saat mendaftar.';
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _showPopup(String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'Peringatan',
      desc: message,
      btnOkText: 'OK',
      btnOkOnPress: () {},
    ).show();
  }

  void _showSuccessDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Pendaftaran Berhasil',
      desc: 'Selamat, akun kamu berhasil dibuat. Silakan login!',
      btnOkText: 'LOGIN',
      btnOkOnPress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
    ).show();
  }
}
