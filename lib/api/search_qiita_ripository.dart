import 'package:dio/dio.dart';
import 'package:qiita_application/model/qiita_article.dart';

Future<List<dynamic>> searchQiitaArticles(String query) async {
  // APIのurl
  String url = 'https://qiita.com/api/v2/items?q=$query&per_page=20';
  print(url);
  final response = await Dio().get(url);

  List<dynamic> articles;

  if (response.statusCode == 200) {
    // null Check
    if (response.data != null) {
      articles = response.data
          .map((dynamic i) => QiitaArticle.fromJson(i as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Data is not exist');
    }
  } else {
    throw Exception('Failed to load sentence');
  }

  return articles;
}
