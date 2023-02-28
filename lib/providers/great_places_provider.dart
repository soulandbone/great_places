import 'package:flutter/material.dart';
import 'package:great_places/helpers/db_helpter.dart';
import 'dart:io';

import '../models/place.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return [..._places];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toIso8601String(),
        title: title,
        image: image,
        location: null);

    _places.add(newPlace);
    notifyListeners();
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }
}
