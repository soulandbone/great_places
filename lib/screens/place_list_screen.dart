import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/great_places_provider.dart';
import './add_place_screen.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Place List'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatPlacesProvider>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: ((ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<GreatPlacesProvider>(
                  child: const Center(
                      child: Text('Got no places yet, start adding some')),
                  builder: (context, providerData, ch) =>
                      providerData.places.isEmpty
                          ? ch!
                          : ListView.builder(
                              itemCount: providerData.places.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(providerData.places[index].title),
                                  leading: CircleAvatar(
                                      backgroundImage: FileImage(
                                          providerData.places[index].image)),
                                  onTap: () {},
                                );
                              },
                            ),
                )),
        ));
  }
}
