import 'package:testscreens/models/subject.dart';
import 'package:flutter/material.dart';

class DetailsShowcase extends StatelessWidget {
  final Subject subject;

  DetailsShowcase(this.subject);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return new Center(
      child: new Text(
        subject.description,
        textAlign: TextAlign.center,
        style: textTheme.subhead.copyWith(color: Colors.white),
      ),
    );
  }
}