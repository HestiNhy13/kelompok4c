import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Profil'),
      ),
      body: Column(
        children: [
          // Profile background and image
          Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/sunset.jpg'), // Replace with your background image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    // Implement edit profile picture functionality
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/profile.jpg'), // Replace with user's profile image
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // User Name
          Text(
            'Michalia Campaka',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          // Event details
          Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Senin, 15.00 - 17.00 WIB',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Bulu Tangkis',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Pelatih - Bapak Sugiyo',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Gor Bung Karno Kab. Nganjuk',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}