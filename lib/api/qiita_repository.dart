import 'package:dio/dio.dart';
import 'package:qiita_application/model/qiita_article.dart';

dynamic fetchQiitaArticles() async {
  // APIのurl
  const url =
      'https://qiita.com/api/v2/items?page=1&per_page=20&query=qiita+user%3AQiita';
  final response = await Dio().get(url);

  List<dynamic> articles;

  if (response.statusCode == 200) {
    // null Check
    if (response.data != null) {
      articles = response.data
          .map((i) => QiitaArticle.fromJson(i as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Data is not exist');
    }
  } else {
    throw Exception('Failed to load sentence');
  }

  return articles;
}
