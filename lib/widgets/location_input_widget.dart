import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 170,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
            child: _previewImageUrl == null
                ? const Text(
                    'No Location chosen',
                    textAlign: TextAlign.center,
                  )
                : Image.network(
                    _previewImageUrl!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: (() {}),
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
            ),
            TextButton.icon(
              onPressed: (() {}),
              icon: const Icon(Icons.map),
              label: const Text('Select on Map'),
            )
          ],
        ),
      ],
    );
  }
}
