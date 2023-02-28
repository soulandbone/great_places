import 'package:flutter/material.dart';
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
  }
}
