import 'package:flutter/material.dart';
import '../widget/custom_button.dart';
import '../widget/custom_card.dart';

class CustomPopup extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;
  final List<Color>? backgroundColor;
  final String buttonText;

  const CustomPopup({
    Key? key,
    required this.message,
    required this.onPressed,
    this.backgroundColor,
    this.buttonText = "Oke",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: CustomCard(
        // gradientColors: gradientColors,
        // backgroundColor: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87, // lebih gelap agar terbaca
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: buttonText,
                onPressed: () {
                  Navigator.of(context).pop();
                  onPressed();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
