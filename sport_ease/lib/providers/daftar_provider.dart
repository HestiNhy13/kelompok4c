import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/daftar_model.dart';

class DaftarProvider extends ChangeNotifier {
  final List<DaftarModel> _riwayat = [];
  bool isLoading = false;

  List<DaftarModel> get riwayatList => _riwayat;

  List<DaftarModel> get riwayat => _riwayat;

  /// Menambahkan pendaftaran baru ke Firestore dan list lokal
  Future<void> tambahPendaftaran(DaftarModel data) async {
    try {
      await FirebaseFirestore.instance
          .collection('pendaftaran')
          .add({
        ...data.toMap(),
        'user_id': data.userId,
        'timestamp': Timestamp.now(),
      });

      _riwayat.add(data);
      notifyListeners();
    } catch (e) {
      print('Gagal menyimpan pendaftaran: $e');
      throw Exception('Gagal menyimpan data pendaftaran');
    }
  }

  /// Mengambil data riwayat berdasarkan userId
  Future<void> fetchRiwayat(String userId) async {
    try {
      isLoading = true;
      notifyListeners();

      final snapshot = await FirebaseFirestore.instance
          .collection('pendaftaran')
          .where('user_id', isEqualTo: userId)
          .orderBy('timestamp', descending: true)
          .get();

      _riwayat.clear();
      for (var doc in snapshot.docs) {
        final model = DaftarModel.fromMap(doc.data());
        _riwayat.add(model);
      }

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print('Gagal mengambil riwayat pendaftaran: $e');
    }
  }
}
