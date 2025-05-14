import 'package:flutter/material.dart';
import '../../core/controllers/otp_controller.dart';
import '../../core/controllers/reset_password_controller.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text.dart';
import '../widget/custom_textcontroller.dart';

class KodeOtpScreen extends StatefulWidget {
  const KodeOtpScreen({Key? key}) : super(key: key);

  @override
  State<KodeOtpScreen> createState() => _KodeOtpScreenState();
}

class _KodeOtpScreenState extends State<KodeOtpScreen> {
  late OtpController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OtpController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(automaticallyImplyLeading: true, title: const Text("Periksa email Anda")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kami telah mengirimkan kode OTP ke email Anda",
                style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 4),
            const Text("admin*****@gmail.com",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) { 
                return SizedBox(
                  width: 60,
                  child: CustomTextField(
                    controller: _controller.controllers[index],
                    focusNode: _controller.focusNodes[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                    onChanged: (value) {
                      _controller.onOtpChanged(index, value, context);
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            Center(
              child: CustomButton(
                text: "Verifikasi Kode",
                onPressed: () => _controller.verifyCode(context),
                borderColor: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  _controller.resendCode(context); // Opsional: tambahkan logika kirim ulang
                },
                child: const Text("Kirim ulang email"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
