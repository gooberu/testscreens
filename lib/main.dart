import 'package:flutter/material.dart';
import 'package:testscreens/ui/subject_list.dart';

void main() async {
  runApp(new TestScreens());
} 

class TestScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.deepPurple,
        fontFamily: 'Ubuntu'
      ),
      home: new SubjectList(),
    );
  }
}

