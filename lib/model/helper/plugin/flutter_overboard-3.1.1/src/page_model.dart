import 'package:flutter/cupertino.dart';

class PageModel {
  PageModel({
    this.color,
    this.titleColor,
    this.bodyColor,
    required this.imageAssetPath,
    required this.title,
    required this.body,
    this.doAnimateImage = false,
  });

  PageModel.withChild({
    required this.child,
    required this.color,
    this.titleColor,
    this.bodyColor,
    this.doAnimateChild = false,
  });

  Color? color;
  String? imageAssetPath;
  String? title;
  String? body;
  Widget? child;
  bool doAnimateChild = false;
  bool doAnimateImage = false;
  Color? titleColor;
  Color? bodyColor;
}
