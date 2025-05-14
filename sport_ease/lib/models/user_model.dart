class UserModel {
  final String uid;
  final String namaLengkap;
  // final String noTelepon;
  final String email;
  // final String alamat;

  UserModel({
    required this.uid,
    required this.namaLengkap,
    // required this.noTelepon,
    required this.email,
    // required this.alamat,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'namaLengkap': namaLengkap,
      // 'noTelepon': noTelepon,
      'email': email,
      // 'alamat': alamat,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      namaLengkap: map['namaLengkap'],
      // noTelepon: map['noTelepon'],
      email: map['email'],
      // alamat: map['alamat'],
    );
  }
}
