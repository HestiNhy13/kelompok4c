import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> registerUser({
    required String email,
    required String password,
  }) async {
    // Validasi email format
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      return 'Format email tidak valid.';
    }

    // Validasi password minimal 8 karakter dan kombinasi huruf kecil dan angka
    if (password.length < 8 ||
        !RegExp(r'(?=.*[a-z])(?=.*\d)').hasMatch(password)) {
      return 'Password harus minimal 8 karakter dan mengandung huruf kecil serta angka.';
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Kirim email verifikasi
      // await userCredential.user?.sendEmailVerification();

      return null; // sukses
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'Email sudah terdaftar.';
      } else if (e.code == 'invalid-email') {
        return 'Format email tidak valid.';
      } else if (e.code == 'weak-password') {
        return 'Password terlalu lemah.';
      } else {
        return e.message ?? 'Terjadi kesalahan.';
      }
    } catch (e) {
      return 'Terjadi kesalahan tak terduga.';
    }
  }

  Future<String?> loginUser({
  required String email,
  required String password,
}) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Jika email belum diverifikasi
    // if (!userCredential.user!.emailVerified) {
    //   await _auth.signOut();
    //   return 'Email belum diverifikasi. Silakan cek kotak masuk email Anda.';
    // }

    return null; // sukses login
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'Email belum terdaftar.'; // Pesan error jika email belum ada di Firebase
    } else if (e.code == 'wrong-password') {
      return 'Password salah.'; // Pesan error jika password salah
    } else {
      return e.message ?? 'Terjadi kesalahan saat login.'; // Pesan error default
    }
  } catch (e) {
    return 'Terjadi kesalahan tak terduga.';
  }
}
}