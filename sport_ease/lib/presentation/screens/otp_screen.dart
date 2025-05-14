import 'package:flutter/material.dart';
import 'reset_password_screen.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text.dart';
import '../widget/custom_textcontroller.dart';

class OtpScreen extends StatefulWidget{
  const OtpScreen({Key? Key}):super(key: Key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
//list controller untuk 4 input
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<CustomTextController> _controllers = List.generate(4, (_) => CustomTextController());
  
  

  @override
  void dispose() {
    for (var node in _focusNodes){
      node.dispose();
    }
    for (var controller in _controllers){
      controller.dispose();
    }
    super.dispose();
  }
  void _verifyCode(){
    String otpCode = _controllers.map((c) => c.text).join();
    print("Kode OTP : $otpCode");
    //lanjutkan untuk proses verifikasi
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(automaticallyImplyLeading: true, title: Text("Periksa email Anda")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kami telah mengirimkan kode OTP ke email Anda",
                style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 4),
            Text("admin*****@gmail.com",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                return SizedBox(
                  width: 60,
                  child: CustomTextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 3) {
                        _focusNodes[index + 1].requestFocus();
                      } else if (value.isEmpty && index > 0) {
                        _focusNodes[index - 1].requestFocus();
                      }
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 24),
            Center( 
            child:CustomButton(
              text: "Verifikasi Kode",
              onPressed: _verifyCode, borderColor: Colors.black,
            ),),
            SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  print("Kirim ulang email");
                },
                child: Text("Kirim ulang email"),
              ),
            )
          ],
        ),
      ),
    );
  }
}