import 'package:flutter/material.dart';
import 'package:news_app/controller/news_controller.dart';

class Retrycard extends StatelessWidget {
  final NewsController newsController;
  Retrycard(NewsController this.newsController);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Failed to load data',
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              newsController.fetchArticles();
            },
            child: Text('Tap to retry!', textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
