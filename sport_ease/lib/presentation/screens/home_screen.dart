import 'package:flutter/material.dart';
import 'pendaftaran_screen.dart';
import 'riwayat_screen.dart';
import 'profil_screen.dart';
import '../widget/custom_navbar.dart';
import 'detail_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      _buildBeranda(), // index 0
      const PendaftaranScreen(), // index 1
      const RiwayatScreen(),     // index 2
      ProfilePage(),             // index 3
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavbar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTap,
      ),
    );
  }

  Widget _buildBeranda() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _showExitDialog(context);
                    },
                    child: const Icon(Icons.arrow_back_ios, size: 24),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/image/logo1.png',
                    width: 50,
                    height: 70,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    "Trending Events 🔥",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search event...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                children: [
                  _buildTrendingCard(
                    imageUrl: "assets/image/badminton/batminton1.jpeg",
                    title: "Final Badminton SMA 1 Rejos...",
                    date: "30 Mei 2025",
                    price: "IDR50.000/org",
                  ),
                  _buildTrendingCard(
                    imageUrl: "assets/image/karate/karate1.jpeg",
                    title: "Karate KejurProv 2025",
                    date: "01 Juni 2025",
                    price: "IDR50.000/org",
                  ),
                  _buildTrendingCard(
                    imageUrl: "assets/image/basket/basket1.jpeg",
                    title: "Basket 3 on 3",
                    date: "10 Juni 2025",
                    price: "IDR100.000/org",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Upcoming Events",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "See all",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildUpcomingCard(
                    imageUrl: "assets/image/futsal/futsal1.jpeg",
                    title: "Futsal : Final SMAN 1 Tanjunganom",
                    location: "Gedung Juang 45 Nganjuk",
                    date: "Jul 12, 2025",
                    price: "IDR50.000",
                  ),
                  const SizedBox(height: 12),
                  _buildUpcomingCard(
                    imageUrl: "assets/image/voly/voly1.png",
                    title: "Voly: Piala Bupati Nganjuk 20...",
                    location: "Gedung Juang 45 Nganjuk",
                    date: "Jul 22, 2025",
                    price: "IDR75.000",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingCard({
    required String imageUrl,
    required String title,
    required String date,
    required String price,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              imageUrl: imageUrl,
              title: title,
              date: date,
              location: "Gelanggang Remaja",
              price: price,
              description: "Ini adalah deskripsi lengkap untuk event bernama $title.",
            ),
          ),
        );
      },
      child: Container(
        width: 230,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [Colors.black54, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          padding: const EdgeInsets.all(8),
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                date,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
              Text(
                "Start from $price",
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingCard({
    required String imageUrl,
    required String title,
    required String location,
    required String date,
    required String price,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              imageUrl: imageUrl,
              title: title,
              date: date,
              location: location,
              price: price,
              description: "Ini adalah deskripsi lengkap untuk event bernama $title.",
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                imageUrl,
                width: 120,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                price,
                style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Menampilkan dialog konfirmasi keluar dengan custom button
  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Menghindari penutupan dialog dengan klik di luar
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Keluar"),
          content: const Text("Apakah Anda yakin ingin keluar?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
                Navigator.pushReplacementNamed(context, '/login'); // Navigasi ke login page
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              child: const Text("Oke"),
            ),
          ],
        );
      },
    );
  }
}
