import 'package:flutter/material.dart';
import 'package:news/data/data_sources/api_manger.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("search"),
      ),
      body: Container(
        // color: Colors.white,
        height: mediaQuery.size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("Hi"),
            SizedBox(
              height: 50,
              width: 250,
              child: TextFormField(
                onChanged: (value) {
                  ApiManager.fetchArticlesList(value);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
