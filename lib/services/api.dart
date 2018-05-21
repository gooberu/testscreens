import 'dart:convert';
import 'package:testscreens/models/subject.dart';

class SubjectApi {
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