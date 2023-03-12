import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? email;
  String? uid;
  String? photoUrl;
  String? username;
  String? bio;
  List<dynamic>? followers;
  List<dynamic>? following;

  User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });

  User.fromJson(Map<String,dynamic>json){
    email = json['email'];
    username = json['username'];
    uid = json['uid'];
    bio = json['bio'];
    photoUrl = json['photoUrl'];
    followers = json['followers'];
    following = json['following'];
  }



  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "bio": bio,
        "followers": followers,
        "following": following,
      };
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot= snap.data() as Map<String, dynamic>;
    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      photoUrl: snapshot['photoUrl'],
      bio: snapshot['bio'],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}
