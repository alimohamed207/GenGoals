import 'package:flutter/material.dart';
import 'package:flutter_samples/map/model/location.dart';

class LatLongWidget extends StatelessWidget {
  final Location location;

  const LatLongWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            location.title,
            style: const TextStyle(color: Colors.white70),
          ),
          const Icon(Icons.location_on, color: Colors.white70),
          // Text(
          //   location.title,
          //   style: const TextStyle(color: Colors.white70),
          // )
        ],
      );
}
