import 'dart:async';
import 'dart:convert';
import 'package:testscreens/models/subject.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SubjectApi {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = new GoogleSignIn();
  FirebaseUser firebaseUser;
  SubjectApi(FirebaseUser user) {
    this.firebaseUser = user;
  }
  static Future<SubjectApi> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return new SubjectApi(user);
  }
  static List<Subject> allSubjectsFromJson(String jsonData) {
    List<Subject> subjects = [];
    json.decode(jsonData)['subjects'].forEach((subject) => subjects.add(_fromMap(subject)));
    return subjects;
  }

  static Subject _fromMap(Map<String, dynamic> map) {
    return new Subject(
      externalId: map['id'],
      name: map['name'],
      description: map['description'],
      avatarUrl: map['image_url'],
      location: map['location'],
      likeCounter: map['like_counter'],
      isOnline: map['online'],
      pictures: new List<String>.from(map['pictures']),
      badges: new List<String>.from(map['badges']),
    );
  }
}