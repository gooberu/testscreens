import 'package:flutter/material.dart';

class SubjectList extends StatefulWidget {
  @override
  _SubjectListState createState() => new _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  Widget _getAppTitleWidget(){
    return new Text(
      'Testscreens',
      style: new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: _getAppTitleWidget(),
    );
  }
}