import 'package:flutter/material.dart';

class CustomTextController extends TextEditingController {
  CustomTextController({String? text}) : super(text: text);

  // Kamu masih bisa menambahkan fungsi tambahan kalau perlu
  void setText(String value) {
    this.text = value;
    // notifyListeners() tidak perlu kalau tidak override behavior
  }

  String getText() {
    return text;
  }

  @override
  void dispose() {
    super.dispose(); // Tetap panggil dispose dari superclass
  }
}
