import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/core/config/page_routes_name.dart';
import 'package:news/core/theme/colors_palette.dart';
import 'package:news/features/home/pages/search_screen.dart';
import 'package:news/features/home/widget/category_item_widget.dart';
import 'package:news/features/home/widget/custom_drawer.dart';
import 'package:news/features/home/widget/selected_category.dart';

import '../../../data/models/category_data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryData> categoryDataList = [
    CategoryData(
      categoryId: "sports",
      categoryName: "Sports",
      categoryIcon: "assets/icons/ball.png",
      categoryBackgroundColor: ColorsPalette.redColor,
    ),
    CategoryData(
      categoryId: "general",
      categoryName: "Politics",
      categoryIcon: "assets/icons/Politics.png",
      categoryBackgroundColor: ColorsPalette.blueColor,
    ),
    CategoryData(
      categoryId: "health",
      categoryName: "Health",
      categoryIcon: "assets/icons/health.png",
      categoryBackgroundColor: ColorsPalette.pinkColor,
    ),
    CategoryData(
      categoryId: "business",
      categoryName: "Business",
      categoryIcon: "assets/icons/bussines.png",
      categoryBackgroundColor: ColorsPalette.brownColor,
    ),
    CategoryData(
      categoryId: "environment",
      categoryName: "Environment",
      categoryIcon: "assets/icons/environment.png",
      categoryBackgroundColor: ColorsPalette.lightBlueColor,
    ),
    CategoryData(
      categoryId: "science",
      categoryName: "Science",
      categoryIcon: "assets/icons/science.png",
      categoryBackgroundColor: ColorsPalette.yellowColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/images/pattern.png")),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(selectCategoryData == null
              ? "News App"
              : selectCategoryData!.categoryName),
          actions: [
            if (selectCategoryData != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchScreen());
                    // Navigator.pushNamed(context, PageRoutesName.search);
                  },
                  icon: const Icon(Icons.search),
                ),
              )
          ],
        ),
        drawer: CustomDrawer(
          onCategoryChangedClicked: onCategoryChangedClicked,
        ),
        body: selectCategoryData == null
            ? Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pick your category \nof interest",
                      style: theme.textTheme.bodyLarge!.copyWith(
                          color: ColorsPalette.blackLightColor, height: 1.2),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding:
                            const EdgeInsets.only(top: 20, left: 15, right: 15),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 22,
                                childAspectRatio: 0.90),
                        itemBuilder: (context, index) => CategoryItemWidget(
                          index: index,
                          categoryData: categoryDataList[index],
                          onCategoryClicked: onCategoryClicked,
                        ),
                        itemCount: categoryDataList.length,
                      ),
                    )
                  ],
                ),
              )
            : SelectedCategoryView(
                categoryData: selectCategoryData!,
              ),
      ),
    );
  }

  CategoryData? selectCategoryData;

  void onCategoryClicked(CategoryData categoryData) {
    setState(() {
      selectCategoryData = categoryData;
    });
  }

  void onCategoryChangedClicked() {
    setState(() {
      selectCategoryData = null;
      Navigator.pop(context);
    });
  }
}
