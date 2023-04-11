import 'package:flutter/material.dart';
import 'package:qiita_application/model/qiita_article.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({super.key, @required this.article});

  final QiitaArticle? article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // 記事タイトル
          article!.title.toString(),
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ),
      body: WebView(
        // WebView表示
        initialUrl: article?.url,
        // JavaScriptを有効化
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
