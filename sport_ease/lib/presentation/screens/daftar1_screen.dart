import 'package:flutter/material.dart';
import 'daftar2_screen.dart';

/// [Daftar1Screen] menampilkan halaman daftar dengan layout berikut:
/// - Header biru di atas (judul & subjudul + tombol back)
/// - Card putih di bawah yang sedikit “naik” menggunakan transform,
///   berisi form: Nama Lengkap, No. Telepon, Alamat, Kategori Olahraga.
/// - Tombol "Daftar" di bawah form.
///
/// Menggunakan [Matrix4.translationValues(0, -16, 0)] untuk efek overlapping,
/// alih-alih margin negatif (yang menimbulkan error di Web).

class Daftar1Screen extends StatefulWidget {
  // Jika ingin mengisi "Kategori Olahraga" otomatis, terima param [namaOlahraga].
  final String? namaOlahraga;

  const Daftar1Screen({super.key, this.namaOlahraga});

  @override
  State<Daftar1Screen> createState() => _Daftar1ScreenState();
}

class _Daftar1ScreenState extends State<Daftar1Screen> {
  // Controller input field
  final _namaController = TextEditingController();
  final _telpController = TextEditingController();
  final _alamatController = TextEditingController();
  final _kategoriController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Jika ada data olahraga dikirim dari halaman lain (misal detailolahraga),
    // isi field kategori otomatis
    if (widget.namaOlahraga != null) {
      _kategoriController.text = widget.namaOlahraga!;
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _telpController.dispose();
    _alamatController.dispose();
    _kategoriController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Kita buat scrollable agar di layar kecil tidak overflow
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1) HEADER BIRU
            Container(
              width: double.infinity,
              color: Colors.blue,
              // Tambah padding atas agar tampak lebih “luas” di web
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tombol Back
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  // Judul + subjudul
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "DAFTAR",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Lengkapi Data Diri Anda",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 2) CARD PUTIH, DIPINDAH KE ATAS SEDIKIT DENGAN TRANSFORM
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                // Sudut atas melengkung
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              // Ganti margin negatif dengan transform agar aman di Web
              transform: Matrix4.translationValues(0, -16, 0),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NAMA LENGKAP
                  const Text(
                    "Nama Lengkap",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _namaController,
                    decoration: InputDecoration(
                      hintText: "Masukkan Nama Lengkap",
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // NO. TELEPON
                  const Text(
                    "No. Telepon",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _telpController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Masukkan No. Telepon",
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ALAMAT
                  const Text(
                    "Alamat",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _alamatController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: "Masukkan Alamat",
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // KATEGORI OLAHRAGA
                  const Text(
                    "Kategori Olahraga",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _kategoriController,
                    decoration: InputDecoration(
                      hintText: "Masukkan atau Pilih Kategori Olahraga",
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // TOMBOL "DAFTAR"
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onDaftarPressed,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.blue, // Ganti warna sesuai tema
                      ),
                      child: const Text(
                        "Daftar",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  // Biar ada space di bawah
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Validasi sederhana ketika tombol "Daftar" ditekan
  void _onDaftarPressed() {
    final nama = _namaController.text.trim();
    final telp = _telpController.text.trim();
    final alamat = _alamatController.text.trim();
    final kategori = _kategoriController.text.trim();

    // Cek field kosong
    if (nama.isEmpty || telp.isEmpty || alamat.isEmpty || kategori.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Mohon lengkapi data.")),
      );
      return;
    }
    // setelah daftar ditekan akan masuk ke daftar2.dart
    // Setelah data valid, baru navigasi ke Daftar2Screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Daftar2Screen()),
    );
    // Tampilkan pesan sukses (atau kirim data ke server)
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //       content: Text("Sukses daftar: $nama / $telp / $alamat / $kategori")),
    // );
  }
}