class UserModel {
  final String uid;
  final String email;

  var name;

  UserModel({required this.uid, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
    };
  }

  factory UserModel.fromMap(String uid, Map<String, dynamic> map) {
  return UserModel(
    uid: uid,
    email: map['email'] ?? '',
  );
}

}
