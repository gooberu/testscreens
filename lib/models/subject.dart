import 'package:meta/meta.dart';

class Subject {
  final int externalId;
  final String name;
  final String description;
  final String avatarUrl;
  final String location;
  final int likeCounter;
  final bool isOnline;
  final List<String> pictures;
  final List<String> tags;

  Subject({
    @required this.externalId,
    @required this.name,
    @required this.description,
    @required this.avatarUrl,
    @required this.location,
    @required this.likeCounter,
    @required this.isOnline,
    @required this.pictures,
    @required this.tags,
  });

  @override
  String toString() {
    return "Subject $externalId is named $name";
  }
}