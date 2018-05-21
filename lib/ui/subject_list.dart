import 'dart:async';
import 'package:testscreens/models/subject.dart';
import 'package:testscreens/services/api.dart';
import 'package:flutter/material.dart';

class SubjectList extends StatefulWidget {
  @override
  _SubjectListState createState() => new _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  List<Subject> _subjects = [];

  @override
  void initState() {
    super.initState();
    _loadSubjects();
  }
  
  _loadSubjects() async {
    String fileData = await DefaultAssetBundle.of(context).loadString("assets/subjects.json");
    setState(() {
      _subjects = SubjectApi.allSubjectsFromJson(fileData);
    });
  }

  Widget _buildSubjectItem(BuildContext context, int index) {
    Subject subject = _subjects[index];
    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              //onTap: () => _navigateToSubjectDetails(subject, index),
              leading: new Hero(
                tag: index,
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(subject.avatarUrl),
                ),
              ),
              title: new Text(
                subject.name,
                style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              subtitle: new Text(subject.description),
              isThreeLine: true, // Less Cramped Tile
              dense: false, // Less Cramped Tile
            ),
          ],
        ),
      ),
    );
  }

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

  Widget _buildBody() {
    return new Container(
      margin: const EdgeInsets.fromLTRB(
        8.0,  // A left margin of 8.0
        56.0, // A top margin of 56.0
        8.0,  // A right margin of 8.0
        0.0   // A bottom margin of 0.0
      ),
      child: new Column(
        // A column widget can have several
        // widgets that are placed in a top down fashion
        children: <Widget>[
          _getAppTitleWidget(),
          _getListViewWidget()
        ],
      ),
    );
  }

  Future<Null> refresh() {
    _loadSubjects();
    return new Future<Null>.value();
  }

  Widget _getListViewWidget() {
    return new Flexible(
      child: new RefreshIndicator(
        onRefresh: refresh,
        child: new ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _subjects.length,
          itemBuilder: _buildSubjectItem
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: _buildBody(),
    );
  }
}