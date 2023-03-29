import 'package:dio/dio.dart';
import 'package:qiita_application/model/person_model.dart';
import 'package:qiita_application/model/qiita_article.dart';

Future<List<Person>> fetchQiitaArticles() async {
  // APIのurl
  const url =
      'https://qiita.com/api/v2/items?page=1&per_page=20&query=qiita+user%3AQiita';
  final response = await Dio().get(url);
  print("response: $response");

  if (response.statusCode == 200) {
    // null Check
    if (response.data != null) {
      List<dynamic> responseDataList;
      // responseのdataを一旦、dynamic型のListとして格納
      responseDataList = response.data!['title'] as List<dynamic>;
    } else {
      throw Exception('Data is not exist');
    }
  } else {
    throw Exception('Failed to load sentence');
  }

  var articles = response.data
      .map((dynamic i) => QiitaArticle.fromJson(i as Map<String, dynamic>))
      .toList();

  print("articles: $articles");

  return articles;
}
