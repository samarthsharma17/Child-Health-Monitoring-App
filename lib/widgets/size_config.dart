import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double screenWidth = 10.0;
  static double screenHeight = 10.0;
  static double defaultSize = 10.0;
  static Orientation orientation = Orientation.landscape;

  void init(BuildContext context) {
    var _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    // On iPhone 11 the defaultSize = 10 almost
    // So if the screen size increase or decrease then our defaultSize also vary
    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}
