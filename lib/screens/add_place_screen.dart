import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a place of your own')),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [Text('This is the new Input with Expanded')],
          ),
        )),
        TextButton(
          onPressed: () {},
          child: const Text('Add Place'),
          style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).accentColor),
        )
      ]),
    );
  }
}
