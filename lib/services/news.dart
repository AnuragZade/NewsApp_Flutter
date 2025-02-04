import 'dart:convert';
import 'dart:developer';

import 'package:news_app_using_api/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  String apiKey = "d10cf0d6fa1d48368cfc73f54e95d614";

  Future<void> getNewsFromAPI() async {
    String url =
        "https://newsapi.org/v2/everything?q=tesla&from=2025-01-04&sortBy=publishedAt&apiKey=$apiKey";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
              content: element['content'],
            );
            news.add(articleModel);
          } else {
            log("Error: API response status code: ${response.statusCode}");
          }
        },
      );
    }
  }
}
