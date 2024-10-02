import 'package:flutter/material.dart';
import '../../../core/theme/colors_palette.dart';
import '../../../data/models/sources_model.dart';

class TabItemWidget extends StatelessWidget {
  final Source source;
  final bool isSelected;

  const TabItemWidget(
      {super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
          color: isSelected ? ColorsPalette.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: ColorsPalette.primaryColor,
          )),
      child: Text(
        source.name,
        style: theme.textTheme.displaySmall!
            .copyWith(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}
