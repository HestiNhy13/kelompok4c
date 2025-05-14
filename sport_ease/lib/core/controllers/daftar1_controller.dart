import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:sport_ease/models/daftar_model.dart';
import 'package:sport_ease/providers/daftar_provider.dart';
import 'package:sport_ease/views/screens/daftar2_screen.dart';

class Daftar1Controller {
  final BuildContext context;
  final TextEditingController namaController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController kategoriController = TextEditingController();

  Daftar1Controller(this.context, String? namaOlahraga) {
    if (namaOlahraga != null) {
      kategoriController.text = namaOlahraga;
    }
  }

  void dispose() {
    namaController.dispose();
    telpController.dispose();
    alamatController.dispose();
    kategoriController.dispose();
  }

 void onDaftarPressed() {
  final nama = namaController.text.trim();
  final telp = telpController.text.trim();
  final alamat = alamatController.text.trim();
  final kategori = kategoriController.text.trim();

  if (nama.isEmpty || telp.isEmpty || alamat.isEmpty || kategori.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Mohon lengkapi data.")),
    );
    return;
  }

  final userId = FirebaseAuth.instance.currentUser?.uid ?? '';

  final data = DaftarModel(
    namaLengkap: nama,
    noTelepon: telp,
    alamat: alamat,
    kategori: kategori,
    tanggal: _formatTanggal(DateTime.now()),
    userId: userId,
  );

  Provider.of<DaftarProvider>(context, listen: false).tambahPendaftaran(data);

  // Tampilkan pop-up konfirmasi
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Berhasil'),
      content: const Text('Pendaftaran berhasil. Tunggu proses verifikasi. Terima kasih.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Tutup dialog
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Daftar2Screen()),
            );
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

}

_formatTanggal(DateTime dateTime) {
}
