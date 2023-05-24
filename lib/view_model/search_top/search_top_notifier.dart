import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita_application/api/search_qiita_ripository.dart';
import 'package:qiita_application/model/qiita_article.dart';

class SearchTopNotifier extends StateNotifier<int> {
  SearchTopNotifier(): super(0);

  Future<void> searchTextBoxChanged(String keyword) async {

    FutureBuilder<List<QiitaArticle>>(
      future: searchQiitaArticles(keyword),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('エラー: ${snapshot.error}');
        } else {
          final articles = snapshot.data;
          return ListView.builder(
            itemCount: articles?.length,
            itemBuilder: (context, index) {
              final article = articles![index];
              return ListTile(
                title: Text(article.title ?? ''),
                onTap: () {
                  // タップ時の処理
                },
              );
            },
          );
        }
      },
    );
  }
}