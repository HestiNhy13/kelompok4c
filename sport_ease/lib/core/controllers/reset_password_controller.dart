import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResetPasswordController {
  final BuildContext context;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  ResetPasswordController(this.context);

  Future<void> updatePassword() async {
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (password.isEmpty || confirmPassword.isEmpty) {
      _showMessage("Kata sandi tidak boleh kosong.");
    } else if (password.length < 8) {
      _showMessage("Kata sandi harus memiliki minimal 8 karakter.");
    } else if (password != confirmPassword) {
      _showMessage("Kata sandi tidak cocok.");
    } else {
      final response = await _resetPassword(password);
      if (response != null && response.statusCode == 200) {
        _showMessage("Kata sandi berhasil diperbarui!", success: true);
        Navigator.pop(context); // Kembali ke halaman sebelumnya
      } else {
        _showMessage("Gagal memperbarui kata sandi. Silakan coba lagi.");
      }
    }
  }

  Future<http.Response?> _resetPassword(String password) async {
    final url = Uri.parse('https://your-api-url.com/reset-password'); // Ganti URL API sesuai backend
    try {
      final response = await http.post(url, body: {'password': password});
      return response;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  void _showMessage(String message, {bool success = false}) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(success ? "Berhasil" : "Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Tutup"),
          )
        ],
      ),
    );
  }

  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
