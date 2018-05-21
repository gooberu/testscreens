import 'package:testscreens/models/subject.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final dynamic subjectBadgeLookup = {
  "TauBetaPi": {"name": "Tau Beta Pi", "icon": FontAwesomeIcons.superpowers},
  "Chemistry101Study": {"name": "Chem101", "icon": FontAwesomeIcons.skyatlas},
  "Physics101Study": {"name": "Phy101", "icon": FontAwesomeIcons.spaceShuttle},
  "GooberU": {"name": "GooberU", "icon": FontAwesomeIcons.snowflakeO},
};

class BadgesShowcase extends StatelessWidget {
  final Subject subject;

  BadgesShowcase(this.subject);

  _createCircleBadge(
    IconData iconData, Color bgColor, Color iconColor, String text) {
      return new Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: new Stack(
          children: <Widget>[
            new CircleAvatar(
              backgroundColor: bgColor,
              child: new Icon(
                iconData,
                color: iconColor,
                size: 36.0,
              ),
              radius: 36.0,
            ),
            new Positioned(
              child: new Text(
                text,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                  color: iconColor,
                ),
              ),
            ),
          ],
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    var items = <Widget>[];

    for (var i = 0; i < subject.badges.length; i++) {
      var badge = _createCircleBadge(
        subjectBadgeLookup[subject.badges[i]]['icon'],
        Colors.white12,
        Colors.white,
        subjectBadgeLookup[subject.badges[i]]['name'],
      );

      items.add(badge);
    }

    var delegate = new SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    );

    return new GridView(
      padding: const EdgeInsets.only(top: 16.0),
      gridDelegate: delegate,
      children: items
    );
  }
}