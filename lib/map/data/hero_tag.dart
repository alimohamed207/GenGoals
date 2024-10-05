import 'package:flutter_samples/map/model/location.dart';

class HeroTag {
  static String image(String urlImage) => urlImage;

  static String addressLine1(Location location) =>
      location.name + location.sdgInfo;
}
