import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:qiita_application/model/qiita_article.dart';
import 'package:http/http.dart' as http;

Future<List<QiitaArticle>> searchQiitaArticles(String query) async {
  // APIのurl
  final url = Uri.parse('https://qiita.com/api/v2/items?q=$query&per_page=20');
  // final response = await Dio().get(url);
  final response = await http.get(url, headers: {'Authorization': 'Bearer 769ffad09e5b910aa5229842f6a9714b1cac418d',},);

  List<dynamic> articles;

  if (response.statusCode == 200) {
    // null Check
    final data = json.decode(response.body) as List<dynamic>;
    return data.map((item) {
      return QiitaArticle(
        title: item['title'],
        url: item['url'],
      );
    }).toList();
  } else {
    throw Exception('Failed to load articles');
  }
    // if (response.data != null) {
    //   articles = response.data
    //       .map((i) => QiitaArticle.fromJson(i as Map<String, dynamic>))
    //       .toList();
    // } else {
    //   throw Exception('Data is not exist');
    // }

}
