import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/category_data.dart';
import '../source_manager/cubit.dart';
import '../source_manager/states.dart';
import 'category_view_details_widget.dart';

class SelectedCategoryView extends StatelessWidget {
  const SelectedCategoryView({super.key, required this.categoryData});

  final CategoryData categoryData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SourceCubit()..getNewsSourcesList(categoryData.categoryId),
      child: BlocConsumer<SourceCubit, SourcesStates>(
        builder: (context, state) {
          var cubit = SourceCubit.get(context);
          if (cubit.sourcesList.isEmpty) {
            return CircularProgressIndicator();
          }
          return CategoryViewDetails(
            sourceList: cubit.sourcesList,
          );
        },
        listener: (context, state) {},
      ),
    );
    // return ChangeNotifierProvider(create: (context)=>
    //     SourceViewModel()..getSourcesList(categoryData.categoryId),
    //   child: Consumer<SourceViewModel>(
    //       builder: (context, vm, _) {
    //         if(vm.sourcesList.isEmpty){return const Center(child: Text("Loading Data..."),);}
    //         return CategoryViewDetails(
    //             sourceList: vm.sourcesList,
    //         );
    //       },
    //   ),
    // );
  }
}
