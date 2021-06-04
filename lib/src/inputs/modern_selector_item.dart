import 'package:flutter/material.dart';

class ModernSelectorItem {
  String id;
  String title;
  String? subtitle;
  Widget? leading;

  ModernSelectorItem({
    required this.id,
    required this.title,
    this.subtitle,
    this.leading
  });
}