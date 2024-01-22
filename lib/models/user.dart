import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String fullname;
  final List locals;

  const User({
    required this.username,
    required this.uid,
    required this.photoUrl,
    required this.email,
    required this.fullname,
    required this.locals,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      fullname: snapshot["fullname"],
      locals: snapshot["locals"],
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'photoUrl': photoUrl,
        'fullname': fullname,
        'locals': locals,
      };
}
