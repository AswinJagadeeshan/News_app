import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/service/news_services.dart';

class NewsController extends GetxController {
  var newsArticles = <NewsArticle>[].obs;
  var originalArticles = <NewsArticle>[].obs; 
  var isLoading = true.obs;
  var isFailed = false.obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      isFailed(false);
      var articles = await NewsService.fetchNewsArticles();
      if (articles != null) {
        newsArticles(articles);
        originalArticles(articles);
      } else {
        isFailed(true);
      }
    } catch (e) {
      isFailed(true);
    } finally {
      isLoading(false);
    }
    
  }

  void updateList() {
    var query = searchTextController.text;

    if (query.isEmpty || query == '') {
newsArticles(originalArticles);       return;
    }
    query = query.toLowerCase();

    newsArticles(originalArticles.where((article) {
      return article.title.toLowerCase().contains(query);
    }).toList());

    
  }
}
