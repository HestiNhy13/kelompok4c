import 'package:flutter/material.dart';
import 'daftar1_screen.dart';

/// Kelas [DetailOlahragaScreen] menampilkan detail "olahraga" / pendaftaran.
/// Menerima data secara terpisah (hariJam, nama, pelatih, lokasi, imageUrl).
class DetailOlahragaScreen extends StatelessWidget {
  final String hariJam;
  final String nama;
  final String pelatih;
  final String lokasi;
  final String imageUrl;

  const DetailOlahragaScreen({
    super.key,
    required this.hariJam,
    required this.nama,
    required this.pelatih,
    required this.lokasi,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Olahraga"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gambar di bagian atas
            Image.network(
              imageUrl,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),

            // Container putih berisi detail
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul
                  Text(
                    "$nama : Ekstrakurikuler",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Kartu ringkasan info
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Baris: nama + hariJam
                        Row(
                          children: [
                            const Icon(Icons.sports_basketball,
                                color: Colors.blue),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    nama,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    hariJam,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Baris: lokasi
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.blue),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                lokasi,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Baris: pelatih
                        Row(
                          children: [
                            const Icon(Icons.person, color: Colors.blue),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Pelatih: $pelatih",
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Deskripsi
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Integer id augue iaculis, iaculis orci ut, blandit quam. "
                    "Mauris in sapien vitae tortor scelerisque commodo. ",
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),

                  // Tombol "Daftar"
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Aksi ketika tombol ditekan
                        // tambah saat ditekan akan masuk ke daftar1.dart

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Daftar1Screen(namaOlahraga: nama,)));
                      },
                      child: const Text("Daftar"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}