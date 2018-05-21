import 'package:testscreens/models/subject.dart';
import 'package:testscreens/ui/subject_details/details_body.dart';
import 'package:testscreens/ui/subject_details/footer/details_footer.dart';
import 'package:testscreens/ui/subject_details/header/details_header.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class SubjectDetailsPage extends StatefulWidget {
  final Subject subject;
  final Object avatarTag;

  SubjectDetailsPage(
    this.subject, {
    @required this.avatarTag,
  });

  @override
  _SubjectDetailsPageState createState() => new _SubjectDetailsPageState();
}

class _SubjectDetailsPageState extends State<SubjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var linearGradient = new BoxDecoration(
      gradient: new LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: [
          Colors.blue,
          Colors.blue,
        ],
      ),
    );

    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          decoration: linearGradient,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new SubjectDetailHeader(
                widget.subject,
                avatarTag: widget.avatarTag,
              ),
              new Padding(
                padding: const EdgeInsets.all(24.0),
                child: new SubjectDetailBody(widget.subject),
              ),
              new SubjectShowcase(widget.subject),
            ],
          ),
        ),
      ),
    );
  }
}
