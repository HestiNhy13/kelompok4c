import 'package:flutter/material.dart';
import 'package:sport_ease/views/screens/home_screen.dart';
import 'detail_olahraga_screen.dart';
import 'package:sport_ease/core/controllers/pendaftaran_controller.dart';

class PendaftaranScreen extends StatefulWidget {
  const PendaftaranScreen({super.key});

  @override
  State<PendaftaranScreen> createState() => _PendaftaranScreenState();
}

class _PendaftaranScreenState extends State<PendaftaranScreen> {
  final TextEditingController _searchController = TextEditingController();
  late List<Olahraga> _displayList;

  @override
  void initState() {
    super.initState();
    _displayList = PendaftaranController.listOlahraga;
  }

  void _filterList(String query) {
    setState(() {
      _displayList = PendaftaranController.filterList(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          ),
        ),
        title: const Text("Pendaftaran"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        backgroundColor: Colors.blue.shade500,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterList,
              decoration: InputDecoration(
                hintText: "Pencarian...",
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 0, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _displayList.length,
              itemBuilder: (context, index) {
                final item = _displayList[index];
                return _buildListItem(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(Olahraga item) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            item.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          item.hariJam,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.nama,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text("Pelatih -> ${item.pelatih}"),
            Text(item.lokasi),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailOlahragaScreen(
                hariJam: item.hariJam,
                nama: item.nama,
                pelatih: item.pelatih,
                lokasi: item.lokasi,
                imageUrl: item.imageUrl,
              ),
            ),
          );
        },
      ),
    );
  }
}
