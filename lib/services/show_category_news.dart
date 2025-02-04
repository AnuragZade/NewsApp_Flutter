import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../model/show_category.dart';

class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];
  String apiKey = "d10cf0d6fa1d48368cfc73f54e95d614";

  Future<void> getCategoryNewsFromAPI(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ShowCategoryModel categoryModel = ShowCategoryModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
              content: element['content'],
            );
            categories.add(categoryModel);
          } else {
            log("Error: API response status code: ${response.statusCode}");
          }
        },
      );
    }
  }
}
