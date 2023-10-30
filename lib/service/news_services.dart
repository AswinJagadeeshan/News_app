import 'package:news_app/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static var client = http.Client();

  static Future<List<NewsArticle>?> fetchNewsArticles() async {
    var response = await client.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=bbc7f958d6c8405ca0ef80d677727dd9"));
    if (response.statusCode == 200) {
      return newsArticleFromJson(response.body);
    } else {
      return null;
    }
  }
}
