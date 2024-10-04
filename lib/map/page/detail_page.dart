import 'package:flutter/material.dart';
import 'package:flutter_samples/map/data/hero_tag.dart';
import 'package:flutter_samples/map/model/location.dart';
import 'package:flutter_samples/map/widget/detailed_info_widget.dart';
import 'package:flutter_samples/map/widget/hero_widget.dart';
import 'package:flutter_samples/map/widget/lat_long_widget.dart';
import 'package:flutter_samples/map/widget/reviews_widget.dart';

class DetailPage extends StatelessWidget {
  final Location location;
  final Animation<double> animation;

  const DetailPage(
      {super.key, required this.location, required this.animation});

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('INTERESTS'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: Navigator.of(context).pop,
            ),
            const SizedBox(width: 10)
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox.expand(
                      child: HeroWidget(
                        tag: HeroTag.image(location.urlImage),
                        child:
                            Image.asset(location.urlImage, fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: LatLongWidget(location: location),
                    ),
                  ],
                ),
              ),
              DetailedInfoWidget(location: location),
              const Expanded(
                flex: 5,
                child: Text('sdaddaddada'),
              ),
            ],
          ),
        ),
      );
}
