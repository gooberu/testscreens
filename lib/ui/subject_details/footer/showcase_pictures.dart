import 'package:testscreens/models/subject.dart';
import 'package:flutter/material.dart';

class PicturesShowcase extends StatelessWidget {
  final Subject subject;

  PicturesShowcase(this.subject);

  @override
  Widget build(BuildContext context) {
    var items = <Widget>[];

    for (var i = 0; i < subject.pictures.length; i++) {
      var image = new Image.network(
        subject.pictures[i],
        width: 200.0,
        height: 200.0,
      );
      items.add(image);
    }

    var delegate = new SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    );

    return new GridView(
      padding: const EdgeInsets.only(top: 16.0),
      gridDelegate: delegate,
      children: items,
    );
  }
}