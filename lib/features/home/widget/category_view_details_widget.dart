import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/home/widget/article_list_widget.dart';
import 'package:news/features/home/widget/tab_item_widget.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/colors_palette.dart';
import '../../../data/data_sources/api_manger.dart';
import '../../../data/models/articles_model.dart';
import '../../../data/models/sources_model.dart';
import '../article_manager/cubit.dart';
import '../article_manager/states.dart';
import '../viewModel/article_view_model.dart';
import 'article_item_widget.dart';

class CategoryViewDetails extends StatefulWidget {
  final List<Source> sourceList;

  const CategoryViewDetails({super.key, required this.sourceList});

  @override
  State<CategoryViewDetails> createState() => _CategoryViewDetailsState();
}

class _CategoryViewDetailsState extends State<CategoryViewDetails> {
  int selectedIndex = 0;
  late ArticleViewModel _articlesViewModel;
  late ArticleCubit _articleCubit;

  @override
  void initState() {
    _articlesViewModel = ArticleViewModel();
    _articleCubit = ArticleCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sourceList.length,
            child: TabBar(
                isScrollable: true,
                indicator: const BoxDecoration(),
                labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                indicatorPadding: EdgeInsets.zero,
                // dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                padding: const EdgeInsets.symmetric(vertical: 10),
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                  _articleCubit
                      .getNewsArticlesList(widget.sourceList[selectedIndex].id);
                },
                tabs: widget.sourceList
                    .map((source) => TabItemWidget(
                          source: source,
                          isSelected: selectedIndex ==
                              widget.sourceList.indexOf(source),
                        ))
                    .toList())),
        BlocProvider(
          create: (context) => _articleCubit
            ..getNewsArticlesList(widget.sourceList[selectedIndex].id),
          child: BlocConsumer<ArticleCubit, ArticlesStates>(
            builder: (context, state) {
              var cubit = ArticleCubit.get(context);
              if (cubit.articlesList.isEmpty) {
                return CircularProgressIndicator();
              }
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      ArticleItemWidget(article: cubit.articlesList[index]),
                  itemCount: cubit.articlesList.length,
                ),
              );
            },
            listener: (context, state) {},
          ),
        )
        // ArticleListWidget(sourceId: widget.sourceList[selectedIndex].id ),
        // ChangeNotifierProvider(create: (context)=>
        // _articlesViewModel..getArticlesList(widget.sourceList[selectedIndex].id),
        // child: Consumer<ArticleViewModel>(
        // builder: (context, vm, _) {
        // if(vm.articlesList.isEmpty){return const Center(child: Text("Loading Data..."),);}
        // return Expanded(
        // child: ListView.builder(
        // itemBuilder: (context,index)=>ArticleItemWidget(
        // article:vm.articlesList[index]
        // ),
        // itemCount: vm.articlesList.length,
        // ),
        // );
        // },
        // ),
        // )
      ],
    );
  }
}
