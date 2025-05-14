// lib/screens/profil_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_ease/core/controllers/profil_controller.dart';
import 'package:sport_ease/providers/user_provider.dart';
import '../screens/edit_profil_screen.dart';
import '../screens/splash_screen.dart';
import '../widget/custom_text.dart';

class ProfilScreen extends StatelessWidget {
  void _showExitConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Keluar Aplikasi"),
        content: Text("Yakin anda ingin keluar?"),
        actions: [
          TextButton(
            child: Text("Batal"),
            onPressed: () => Navigator.pop(ctx),
          ),
          TextButton(
            child: Text("Oke"),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => SplashScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  void _goToEditProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EditProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return ChangeNotifierProvider(
      create: (_) => ProfilController()
        ..setUserData(name: user!.name ?? '', email: user.email ?? ''),
      child: Consumer<ProfilController>(
        builder: (context, controller, _) {
          return Scaffold(
            body: Column(
              children: [
                // Header
                Container(
                  height: 50,
                  color: Colors.blue.shade500,
                  padding: EdgeInsets.only(top: 10, right: 16, left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Profil", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: Icon(Icons.exit_to_app, color: Colors.white),
                        onPressed: () => _showExitConfirmation(context),
                      ),
                    ],
                  ),
                ),

                // Konten
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F8F6),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 20),

                          // Foto profil
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundImage: controller.profileImage != null
                                    ? FileImage(controller.profileImage!)
                                    : AssetImage('assets/profile.jpg') as ImageProvider,
                              ),
                              Positioned(
                                right: 0,
                                child: GestureDetector(
                                  onTap: () => controller.pickImage(),
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.orange,
                                    child: Icon(Icons.edit, size: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16),

                          // Email tampil
                          Text(user!.email ?? "email@example.com", style: TextStyle(fontSize: 14, color: Colors.grey[700])),

                          SizedBox(height: 16),
                          Divider(color: Colors.grey[400]),
                          SizedBox(height: 16),

                          // CustomTextField Nama
                          CustomTextField(
                            controller: controller.nameController,
                            hintText: 'Nama',
                            borderColor: Colors.grey,
                            fillColor: Colors.white,
                          ),
                          SizedBox(height: 12),

                          // CustomTextField Email (readOnly)
                          CustomTextField(
                            controller: controller.emailController,
                            hintText: 'Email',
                            borderColor: Colors.grey,
                            fillColor: Colors.white,
                            style: TextStyle(color: Colors.grey),
                            onChanged: (_) {},
                            // readOnly handling bisa ditambahkan di CustomTextField jika diinginkan
                          ),

                          SizedBox(height: 24),

                          // Tombol Edit Profil
                          ElevatedButton.icon(
                            onPressed: () => _goToEditProfile(context),
                            icon: Icon(Icons.edit),
                            label: Text("Edit Profil"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF166BAA),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            ),
                          ),

                          SizedBox(height: 12),

                          // Tombol Perbarui
                          ElevatedButton(
                            onPressed: () => controller.updateData(context),
                            child: Text("Perbarui"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            ),
                          ),

                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
