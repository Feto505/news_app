import 'package:flutter/material.dart';
import 'package:news/core/theme/colors_palette.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/articles_model.dart';

class ArticleDetailsWidget extends StatelessWidget {
  // Article article;
  const ArticleDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)!.settings.arguments as Article;
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/images/pattern.png")),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(article.title ?? ""),
          backgroundColor: ColorsPalette.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    // height: 230,
                    width: mediaQuery.size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
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
                  style: theme.textTheme.displaySmall,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  article.title,
                  textAlign: TextAlign.start,
                  style: theme.textTheme.displaySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      article.publishedAt.substring(0, 10),
                      textAlign: TextAlign.start,
                      style: theme.textTheme.displaySmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    children: [
                      Text(
                        article.description ?? '',
                        style: theme.textTheme.displaySmall,
                      ),
                      //content
                      const Divider(
                        color: Colors.black,
                      ),
                      Text(
                        article.description ?? '',
                        style: theme.textTheme.displaySmall,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(article.url ?? ''),
                              mode: LaunchMode.inAppBrowserView);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "View full article",
                              style: theme.textTheme.displaySmall,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 18,
                              color: ColorsPalette.primaryColor,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
