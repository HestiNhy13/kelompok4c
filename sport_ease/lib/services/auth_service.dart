import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register user (digunakan di RegisterScreen)
  Future<String?> registerUser({
    required String name,
    required String email,
    // required String phone,
    // required String address,
    required String password,
  }) async {
    try {
      // Buat akun di Firebase Auth
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Buat model user untuk Firestore
        UserModel newUser = UserModel(
          uid: user.uid,
          namaLengkap: name,
          email: email,
          // noTelepon: phone,
          // alamat: address,
        );

        // Simpan ke Firestore
        await _firestore.collection('users').doc(user.uid).set(newUser.toMap());

        return null; // Registrasi berhasil
      } else {
        return 'Gagal membuat akun.';
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  // Login user (digunakan di LoginScreen)
  Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // Login berhasil
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Get current user
  User? get currentUser => _auth.currentUser;
}
