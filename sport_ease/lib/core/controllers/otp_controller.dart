import 'package:flutter/material.dart';
import '../../views/widget/custom_textcontroller.dart';
import '../../views/screens/verifikasi_email_screen.dart'; // Layar tujuan

class OtpController {
  // Ubah menjadi 4 digit OTP
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
  final List<CustomTextController> controllers = List.generate(4, (_) => CustomTextController());

  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
  }

  String getOtpCode() {
    return controllers.map((c) => c.text).join();
  }

  void onOtpChanged(int index, String value, BuildContext context) {
    if (value.isNotEmpty && index < focusNodes.length - 1) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void verifyCode(BuildContext context) {
    String otp = getOtpCode();

    if (otp == "1234") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ResetPassword()),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Kode Salah"),
          content: const Text("Kode OTP yang Anda masukkan tidak cocok."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Tutup"),
            ),
          ],
        ),
      );
    }
  }

  void resendCode(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Kode OTP telah dikirim ulang."),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
