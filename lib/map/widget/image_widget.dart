import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/map/data/hero_tag.dart';
import 'package:flutter_samples/map/model/location.dart';
import 'package:flutter_samples/map/widget/hero_widget.dart';
import 'package:flutter_samples/map/widget/lat_long_widget.dart';

class ImageWidget extends StatelessWidget {
  final Location location;

  const ImageWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      /// space from white container
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: size.height * 0.5,
      width: size.width * 0.8,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          children: [
            buildImage(),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTopText(),
                  LatLongWidget(location: location),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage() => SizedBox.expand(
        child: HeroWidget(
          tag: HeroTag.image(location.urlImage),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image.asset(location.urlImage, fit: BoxFit.cover),
          ),
        ),
      );

  Widget buildTopText() => Text(
        location.name,
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 40,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: const Offset(5.0, 5.0),
              blurRadius: 10.0,
              color: AppColors.primaryColor.withOpacity(0.5),
            ),
            Shadow(
              offset: const Offset(-5.0, -5.0),
              blurRadius: 10.0,
              color: Colors.blue.withOpacity(0.5),
            ),
          ],
        ),
      );
}
