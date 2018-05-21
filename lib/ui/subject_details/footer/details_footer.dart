import 'package:testscreens/models/subject.dart';

import 'package:testscreens/ui/subject_details/footer/showcase_badges.dart';
import 'package:testscreens/ui/subject_details/footer/showcase_details.dart';
import 'package:testscreens/ui/subject_details/footer/showcase_pictures.dart';

import 'package:flutter/material.dart';

class SubjectShowcase extends StatefulWidget {
  final Subject subject;

  SubjectShowcase(this.subject);

  @override
  _SubjectShowcaseState createState() => new _SubjectShowcaseState();
}

class _SubjectShowcaseState extends State<SubjectShowcase>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  initState() {
    super.initState();
    _tabs = [
      new Tab(text: 'Pictures'),
      new Tab(text: 'Details'),
      new Tab(text: 'Badges'),
    ];
    _pages = [ 
      new PicturesShowcase(widget.subject),
      new DetailsShowcase(widget.subject),
      new BadgesShowcase(widget.subject), 
    ];
    _controller = new TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: [
          new TabBar(
            controller: _controller,
            tabs: _tabs,
            indicatorColor: Colors.white,
          ),
          new SizedBox.fromSize(
            size: const Size.fromHeight(300.0),
            child: new TabBarView(
              controller: _controller,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}