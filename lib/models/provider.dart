import 'package:meta/meta.dart';

class Provider {
  final String documentId;
  final int externalId;
  final String name;
  final String description;
  final String avatarUrl;
  final String location;
  final int likeCounter;
  final bool isOnline;
  final List<String> pictures;
  final List<String> badges;

  Provider({
    @required this.documentId,
    @required this.externalId,
    @required this.name,
    @required this.description,
    @required this.avatarUrl,
    @required this.location,
    @required this.likeCounter,
    @required this.isOnline,
    @required this.pictures,
    @required this.badges,
  });

  @override
  String toString() {
    return "Provider $externalId is named $name";
  }
}