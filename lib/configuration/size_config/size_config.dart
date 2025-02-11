import 'dart:math';

import 'package:flutter/material.dart';

class SizeConfig {
  SizeConfig({
    required double widthScale,
    required double heightScale,
    bool minTextAdapt = false,
  })  : _widthScale = widthScale,
        _heightScale = heightScale,
        _textScale = minTextAdapt ? min(widthScale, heightScale) : widthScale;

  factory SizeConfig.initialize({
    required BuildContext context,
    required double draftWidth,
    required double draftHeight,
    bool minTextAdapt = false,
  }) {
    final double actualWidth = MediaQuery.of(context).size.width;
    final double widthScale = actualWidth / draftWidth;

    //height scale calculate
    final double actualHeight = MediaQuery.of(context).size.height;
    final double heightScale = actualHeight / draftHeight;

    instance = SizeConfig(
        heightScale: heightScale,
        widthScale: widthScale,
        minTextAdapt: minTextAdapt);

    if (instance != null) {
      return instance!;
    } else {
      return instance!;
    }
  }

  late final double _widthScale;
  late final double _heightScale;
  late final double _textScale;

  double getHeight(num height) => height * _heightScale;

  double getWidth(num width) => width * _widthScale;

  double getTextSize(num textSize) => textSize * _textScale;

  double getRadius(num r) => r * min(_widthScale, _heightScale);

  static SizeConfig? instance;
}

extension SizeConfigExtension on num {
  double get h => SizeConfig.instance!.getHeight(this);

  double get w => SizeConfig.instance!.getWidth(this);

  double get sp => SizeConfig.instance!.getTextSize(this);

  double get r => SizeConfig.instance!.getRadius(this);
}
