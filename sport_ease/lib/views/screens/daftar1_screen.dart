import 'package:flutter/material.dart';
import 'package:sport_ease/core/controllers/daftar1_controller.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text.dart';

class Daftar1Screen extends StatefulWidget {
  final String? namaOlahraga;

  const Daftar1Screen({super.key, this.namaOlahraga});

  @override
  State<Daftar1Screen> createState() => _Daftar1ScreenState();
}

class _Daftar1ScreenState extends State<Daftar1Screen> {
  late Daftar1Controller _controller;

  @override
  void initState() {
    super.initState();
    _controller = Daftar1Controller(context, widget.namaOlahraga);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildImageSection(), // ✅ Gambar olahraga
            const SizedBox(height: 16),
            _buildFormCard(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 8),
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
                SizedBox(height: 6),
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
    );
  }

  Widget _buildImageSection() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      // child: Image.network(
      //   _controller.gambarOlahraga ?? 'https://via.placeholder.com/400x200', // Gambar dari detail
      //   width: MediaQuery.of(context).size.width * 0.9,
      //   height: 180,
      //   fit: BoxFit.cover,
      // ),
    );
  }

  Widget _buildFormCard() {
    return Container(
      transform: Matrix4.translationValues(0, -10, 0), // Sedikit naik
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: _controller.namaController,
            hintText: "Masukkan Nama Lengkap",
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _controller.telpController,
            hintText: "Masukkan No. Telepon",
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _controller.alamatController,
            hintText: "Masukkan Alamat",
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _controller.kategoriController,
            hintText: "Masukkan atau Pilih Kategori",
          ),
          const SizedBox(height: 32),
          Center(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _controller.onDaftarPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Tombol biru
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Daftar",
                  style: TextStyle(fontSize: 16, color: Colors.white), // Font putih
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
