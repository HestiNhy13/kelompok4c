import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:sport_ease/providers/daftar_provider.dart';

class RiwayatController {
  void fetchRiwayat(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Provider.of<DaftarProvider>(context, listen: false).fetchRiwayat(user.uid);
    }
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'disetujui':
        return Colors.green;
      case 'ditolak':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }
}
