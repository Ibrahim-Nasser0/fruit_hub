import 'package:flutter/material.dart';

class PageViewItemModel {
  final String backgroundImage;
  final String iconImage;
  final Widget title;
  final String subtitle;

  const PageViewItemModel({
    required this.backgroundImage,
    required this.iconImage,
    required this.title,
    required this.subtitle,
  });
}
