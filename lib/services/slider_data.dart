import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app_using_api/model/slider_model.dart';

class Sliders {
  List<SliderModel> sliders = [];
  String apiKey = "d10cf0d6fa1d48368cfc73f54e95d614";

  Future<void> getSlidersNewsFromAPI() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$apiKey";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            SliderModel sliderModel = SliderModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
              content: element['content'],
            );
            sliders.add(sliderModel);
          } else {
            log("Error: API response status code: ${response.statusCode}");
          }
        },
      );
    }
  }
}
