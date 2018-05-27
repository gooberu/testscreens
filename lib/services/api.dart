import 'dart:async';
import 'dart:convert';
import 'package:testscreens/models/subject.dart';
import 'package:testscreens/models/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<List<Subject>> getAllSubjects() async {
    return (await Firestore.instance.collection('subjects').getDocuments())
        .documents
        .map((snapshot) => _fromDocumentSnapshot(snapshot))
        .toList();
  }

  StreamSubscription watch(Subject subject, void onChange(Subject subject)) {
    return Firestore.instance
        .collection('subjects')
        .document(subject.documentId)
        .snapshots
        .listen((snapshot) => onChange(_fromDocumentSnapshot(snapshot)));
  }

  Subject _fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data;

    return new Subject(
      documentId: snapshot.documentID,
      externalId: data['id'],
      name: data['name'],
      description: data['description'],
      avatarUrl: data['image_url'],
      location: data['location'],
      likeCounter: data['like_counter'],
      isOnline: data['online'],
      pictures: new List<String>.from(data['pictures']),
      badges: new List<String>.from(data['badges'])
    );
  }

  static Subject _fromMap(Map<String, dynamic> map) {
    return new Subject(
      documentId: map['documentId'],
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

  Future likeSubject(Subject subject) async {
    await Firestore.instance
        .collection('likes')
        .document('${subject.documentId}:${this.firebaseUser.uid}')
        .setData({});
  }

  Future unlikeSubject(Subject subject) async {
    await Firestore.instance
        .collection('likes')
        .document('${subject.documentId}:${this.firebaseUser.uid}')
        .delete();
  }

  Future<bool> hasLikedSubject(Subject subject) async {
    final like = await Firestore.instance
        .collection('likes')
        .document('${subject.documentId}:${this.firebaseUser.uid}')
        .get();

    return like.exists;
  }

}

class ProviderApi {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = new GoogleSignIn();
  FirebaseUser firebaseUser;
  ProviderApi(FirebaseUser user) {
    this.firebaseUser = user;
  }
  static Future<ProviderApi> signInWithGoogle() async {
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

    return new ProviderApi(user);
  }
  static List<Provider> allProvidersFromJson(String jsonData) {
    List<Provider> providers = [];
    json.decode(jsonData)['providers'].forEach((provider) => providers.add(_fromMap(provider)));
    return providers;
  }

  Future<List<Provider>> getAllProviders() async {
    return (await Firestore.instance.collection('providers').getDocuments())
        .documents
        .map((snapshot) => _fromDocumentSnapshot(snapshot))
        .toList();
  }

  StreamSubscription watch(Provider provider, void onChange(Provider provider)) {
    return Firestore.instance
        .collection('providers')
        .document(provider.documentId)
        .snapshots
        .listen((snapshot) => onChange(_fromDocumentSnapshot(snapshot)));
  }

  Provider _fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data;

    return new Provider(
      documentId: snapshot.documentID,
      externalId: data['id'],
      name: data['name'],
      description: data['description'],
      avatarUrl: data['image_url'],
      location: data['location'],
      likeCounter: data['like_counter'],
      isOnline: data['online'],
      pictures: new List<String>.from(data['pictures']),
      badges: new List<String>.from(data['badges'])
    );
  }

  static Provider _fromMap(Map<String, dynamic> map) {
    return new Provider(
      documentId: map['documentId'],
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