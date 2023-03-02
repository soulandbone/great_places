import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places_provider.dart';
import 'package:great_places/widgets/location_input_widget.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../widgets/image_input_widget.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _chosenImage;

  void _pickImage(File chosenImage) {
    _chosenImage = chosenImage;
  }

  void _submitPlace() {
    Provider.of<GreatPlacesProvider>(context, listen: false)
        .addPlace(_titleController.text, _chosenImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new place')),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(hintText: 'Title'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ImageInput(_pickImage),
                const SizedBox(
                  height: 10,
                ),
                LocationInput(),
              ],
            ),
          ),
        )),
        TextButton.icon(
          icon: const Icon(Icons.add),
          onPressed: _submitPlace,
          style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: Theme.of(context).accentColor),
          label: const Text('Add Place'),
        )
      ]),
    );
  }
}
