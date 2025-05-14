import 'package:flutter/material.dart';

class Daftar2Screen extends StatelessWidget {
  const Daftar2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan tombol back dan judul “Pendaftaran”
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Aksi kembali, misal Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        title: const Text("Pendaftaran"),
        centerTitle: true,
      ),

      // Body scrollable agar tidak overflow di layar kecil
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian atas: 
            // Gambar + Card Putih menampilkan info pendaftaran
            Container(
              width: double.infinity,
              color: Colors.blue.shade50, // Latar belakang lembut (opsional)
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Container(
                // Card putih dengan border radius
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Gambar di atas
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        // Ganti URL sesuai gambar olahraga
                        "https://picsum.photos/id/1015/400/250",
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Teks SELAMAT!
                    const Text(
                      "SELAMAT!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Pesan Pendaftaran Berhasil
                    const Text(
                      "Pendaftaran Anda telah berhasil. "
                      "Mohon mengikuti kegiatan Olahraga ini sesuai jadwal yang telah ditentukan.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    const SizedBox(height: 16),

                    // Detail Info (misal 3 item: Bulu Tangkis/Jadwal, Lokasi, Pelatih)
                    _buildInfoItem(
                      icon: Icons.sports_volleyball,
                      title: "Bulu Tangkis",
                      subtitle: "Senin, 15.00 - 17.00 WIB",
                    ),
                    const SizedBox(height: 12),
                    _buildInfoItem(
                      icon: Icons.location_on,
                      title: "Lokasi",
                      subtitle: "Gor Bung Karno Kab.Nganjuk",
                    ),
                    const SizedBox(height: 12),
                    _buildInfoItem(
                      icon: Icons.person,
                      title: "Pelatih",
                      subtitle: "Bapak Sugiyo",
                    ),

                    const SizedBox(height: 16),
                    // Garis putus2 (opsional), 
                    // Anda bisa ganti Divider biasa atau hiasan lain
                    const Divider(thickness: 1, height: 1),

                    const SizedBox(height: 16),
                    // Info tambahan
                    const Text(
                      "Mohon membawa biaya pendaftaran sebesar Rp250.000,00 "
                      "saat awal mengikuti kegiatan olahraga ini.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 24),

                    // Tombol “Kembali”
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Aksi tombol kembali
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.blue, // Warna sesuai tema
                        ),
                        child: const Text(
                          "Kembali",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget item info (ikon + title + subtitle)
  Widget _buildInfoItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.blue),
        ),
        const SizedBox(width: 12),

        // Title + subtitle
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(fontSize: 13)),
            ],
          ),
        )
      ],
    );
  }
}
  