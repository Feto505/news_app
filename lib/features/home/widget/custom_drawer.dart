import 'package:flutter/material.dart';
import 'package:news/core/theme/colors_palette.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onCategoryChangedClicked});

  final void Function() onCategoryChangedClicked;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Container(
      // margin: EdgeInsets.all(20),
      width: mediaQuery.size.width * 0.7,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), //dont work??????????????????????
              bottomRight: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            height: mediaQuery.size.height * .3,
            color: ColorsPalette.primaryColor,
            child: Text(
              "News App!",
              style: theme.textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.list_rounded,
                  color: Colors.black,
                  size: 35,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      onCategoryChangedClicked();
                    },
                    child: Text("Categories", style: theme.textTheme.bodyLarge))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 35,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text("Settings", style: theme.textTheme.bodyLarge)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
