import 'package:flutter/material.dart';

class CategoryData {
  final String categoryId;
  final String categoryName;
  final String categoryIcon;
  final Color categoryBackgroundColor;

  CategoryData(
      {required this.categoryId,
      required this.categoryName,
      required this.categoryIcon,
      required this.categoryBackgroundColor});
}
