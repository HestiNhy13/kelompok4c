import 'package:cloud_firestore/cloud_firestore.dart';

class DaftarModel {
  final String namaLengkap;
  final String noTelepon;
  final String alamat;
  final String kategori;
  final String status;
  final String tanggal;
  // final DateTime timestamp;
  final String userId;

  DaftarModel({
    required this.namaLengkap,
    required this.noTelepon,
    required this.alamat,
    required this.kategori,
    this.status = 'Pending',
    required this.tanggal,
    // required this.timestamp,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'namaLengkap': namaLengkap,
      'noTelepon': noTelepon,
      'alamat': alamat,
      'kategori': kategori,
      'status': status,
      'tanggal': tanggal,
      // 'timestamp': timestamp,
      'user_id': userId, // Menambahkan userId di sini
    };
  }

  factory DaftarModel.fromMap(Map<String, dynamic> map) {
    return DaftarModel(
      namaLengkap: map['namaLengkap'],
      noTelepon: map['noTelepon'],
      alamat: map['alamat'],
      kategori: map['kategori'],
      status: map['status'],
      tanggal: map['tanggal'],
      // timestamp: (map['timestamp'] as Timestamp).toDate(),
      userId: map['user_id'], // Mengambil userId dari map
    );
  }
}
