import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/category_data.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget(
      {super.key,
      required this.categoryData,
      required this.index,
      required this.onCategoryClicked});

  final CategoryData categoryData;
  final int index;
  final void Function(CategoryData) onCategoryClicked;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        onCategoryClicked(categoryData);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: categoryData.categoryBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(25),
            bottomLeft: index % 2 == 0
                ? const Radius.circular(25)
                : const Radius.circular(0),
            bottomRight: index % 2 == 0
                ? const Radius.circular(0)
                : const Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            Expanded(child: Image.asset(categoryData.categoryIcon)),
            Text(
              categoryData.categoryName,
              style: theme.textTheme.bodyMedium!.copyWith(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
