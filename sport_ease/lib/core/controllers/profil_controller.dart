// lib/controllers/profil_controller.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilController extends ChangeNotifier {
  File? _profileImage;
  File? get profileImage => _profileImage;

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  void setUserData({required String name, required String email}) {
    nameController.text = name;
    emailController.text = email;
  }

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _profileImage = File(picked.path);
      notifyListeners();
    }
  }

  void updateData(BuildContext context) {
    // TODO: Integrasi database / Firebase
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Data berhasil diperbarui")),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
