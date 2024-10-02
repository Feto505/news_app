import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/config/page_routes_name.dart';

import '../../../data/models/articles_model.dart';

class ArticleItemWidget extends StatelessWidget {
  final Article article;

  const ArticleItemWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PageRoutesName.article_widget,
            arguments: article);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 230,
                width: mediaQuery.size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      article.urlToImage,
                      fit: BoxFit.cover,
                    ))
                // CachedNetworkImage(
                //     imageUrl: article.urlToImage,
                //   imageBuilder: (context,imageProvider){
                //       return Container(
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(16),
                //           image: DecorationImage(
                //               image: imageProvider,fit: BoxFit.cover
                //           )
                //         ),
                //       );
                //   },
                //   placeholder: (context,url)=>
                //   const Center(child: CircularProgressIndicator(),),
                //   errorWidget: (context,url,error)=>const Icon(
                //     Icons.error,
                //     color: Colors.grey,
                //     size: 45,
                //   ),
                // ),
                ),
            const SizedBox(
              height: 8,
            ),
            Text(
              article.author,
              textAlign: TextAlign.start,
              style:
                  theme.textTheme.displaySmall!.copyWith(color: Colors.black45),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              article.title,
              textAlign: TextAlign.start,
              style: theme.textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
