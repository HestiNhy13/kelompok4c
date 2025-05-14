import 'package:flutter/material.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Tidak perlu Scaffold di sini, karena akan ditampilkan sebagai child dari MainScaffold
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(
          leading: Icon(Icons.event_note),
          title: Text('Riwayat Pendaftaran 1'),
          subtitle: Text('Senin, 15 April 2024'),
        ),
        ListTile(
          leading: Icon(Icons.event_note),
          title: Text('Riwayat Pendaftaran 2'),
          subtitle: Text('Rabu, 17 April 2024'),
        ),
        // Tambah riwayat lainnya sesuai kebutuhan
      ],
    );
  }
}
