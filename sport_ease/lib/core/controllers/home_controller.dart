import 'package:flutter/material.dart';
import 'package:sport_ease/views/screens/event_screen.dart';
import 'package:sport_ease/views/widget/trending_card.dart';
import 'package:sport_ease/views/widget/upcoming_card.dart';

class HomeController {
  static Widget buildBeranda(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade500, Colors.blue.shade200, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
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
                          child: const Icon(Icons.arrow_back_ios, size: 24, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Text(
                          "Trending Events",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.local_fire_department, color: Colors.orange),
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
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16),
                      children: const [
                        Card(
                          elevation: 4,
                          margin: EdgeInsets.only(right: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                          child: TrendingCard(
                            imageUrl: "assets/image/badminton/batminton1.jpeg",
                            title: "Final Badminton SMA 1 Rejos...",
                            date: "30 Mei 2025",
                            price: "IDR50.000/org",
                          ),
                        ),
                        Card(
                          elevation: 4,
                          margin: EdgeInsets.only(right: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                          child: TrendingCard(
                            imageUrl: "assets/image/karate/karate1.jpeg",
                            title: "Karate KejurProv 2025",
                            date: "01 Juni 2025",
                            price: "IDR50.000/org",
                          ),
                        ),
                        Card(
                          elevation: 4,
                          margin: EdgeInsets.only(right: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                          child: TrendingCard(
                            imageUrl: "assets/image/basket/basket1.jpeg",
                            title: "Basket 3 on 3",
                            date: "10 Juni 2025",
                            price: "IDR100.000/org",
                          ),
                        ),
                      ],
                    ),
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
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => EventScreen()));
                    },
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
                children: const [
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: UpcomingCard(
                      imageUrl: "assets/image/futsal/futsal1.jpeg",
                      title: "Futsal : Final SMAN 1 Tanjunganom",
                      location: "Gedung Juang 45 Nganjuk",
                      date: "Jul 12, 2025",
                      price: "IDR50.000",
                    ),
                  ),
                  SizedBox(height: 12),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: UpcomingCard(
                      imageUrl: "assets/image/voly/voly1.png",
                      title: "Voly: Piala Bupati Nganjuk 20...",
                      location: "Gedung Juang 45 Nganjuk",
                      date: "Jul 22, 2025",
                      price: "IDR75.000",
                    ),
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

  static void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Keluar"),
          content: const Text("Apakah Anda yakin ingin keluar?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(foregroundColor: Colors.red, textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: TextButton.styleFrom(foregroundColor: Colors.blue, textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              child: const Text("Oke"),
            ),
          ],
        );
      },
    );
  }
}
