import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_ease/providers/daftar_provider.dart';
import '../widget/custom_card.dart';
import 'package:sport_ease/core/controllers/riwayat_controller.dart';

class RiwayatScreen extends StatefulWidget {
  const RiwayatScreen({super.key});

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  final RiwayatController _controller = RiwayatController();

  @override
  void initState() {
    super.initState();
    _controller.fetchRiwayat(context);
  }

  @override
  Widget build(BuildContext context) {
    final daftarProvider = Provider.of<DaftarProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pendaftaran'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 55, 162, 243),
      ),
      body: daftarProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : daftarProvider.riwayatList.isEmpty
              ? const Center(child: Text('Belum ada riwayat pendaftaran.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: daftarProvider.riwayatList.length,
                  itemBuilder: (context, index) {
                    final item = daftarProvider.riwayatList[index];
                    final statusColor = _controller.getStatusColor(item.status);

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CustomCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama: ${item.namaLengkap}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text('No. Telepon: ${item.noTelepon}',
                                style: const TextStyle(color: Colors.white70)),
                            Text('Alamat: ${item.alamat}',
                                style: const TextStyle(color: Colors.white70)),
                            Text('Kategori: ${item.kategori}',
                                style: const TextStyle(color: Colors.white70)),
                            Text('Tanggal: ${item.tanggal}',
                                style: const TextStyle(color: Colors.white70)),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: statusColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  item.status,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
