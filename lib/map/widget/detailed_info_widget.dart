import 'package:flutter/material.dart';
import 'package:flutter_samples/map/data/hero_tag.dart';
import 'package:flutter_samples/map/model/location.dart';
import 'package:flutter_samples/map/widget/hero_widget.dart';

class DetailedInfoWidget extends StatelessWidget {
  final Location location;

  const DetailedInfoWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroWidget(
              tag: HeroTag.addressLine1(location),
              child: Text(location.sdgInfo),
            ),
            const SizedBox(height: 8),
          ],
        ),
      );
}
