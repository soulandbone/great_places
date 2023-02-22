import 'dart:io';

import 'package:great_places/models/placelocation.dart';

class Place {
  String id;
  String title;
  File image;
  PlaceLocation location;

  Place(
      {required this.id,
      required this.title,
      required this.image,
      required this.location});
}
