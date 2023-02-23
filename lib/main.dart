import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/great_places_provider.dart';
import './screens/add_place_screen.dart';
import './screens/place_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => GreatPlacesProvider(),
        child: MaterialApp(
          title: 'Great Places',
          theme: ThemeData(
              primarySwatch: Colors.indigo, accentColor: Colors.amber),
          home: PlaceList(),
          routes: {AddPlaceScreen.routeName: (ctx) => AddPlaceScreen()},
        ));
  }
}
