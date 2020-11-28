import 'dart:convert';

import 'package:times_news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getnews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&apiKey=274542e1d6fd419880881658d4d1aee1";

    ///keep in mind how to write this url

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getnews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=274542e1d6fd419880881658d4d1aee1";

    ///keep in mind how to write this url

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}
