import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita_application/view/detail_article/detail_article_page.dart';
import 'package:qiita_application/view_model/article_list_view_model.dart';

class ShowSearchResultState extends ConsumerWidget {
  const ShowSearchResultState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qiitaDataList = ref.watch(articleListViewModelProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Qiita検索表示"),
        ),
        body: Container(
          child: qiitaDataList.when(
              data: (qiitaDataList) {
                return ListView.builder(
                  itemCount: qiitaDataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final qiitaData = qiitaDataList[index];
                    return resultItem(context, qiitaData);
                    // return Card(
                    //   child: ListTile(
                    //     title: Text(qiitaData.title.toString()),
                    //   ),
                    // );
                  },
                );
              },
              error: (error, stack) => Text('Error: $error'),
              loading: () => const Center(child: CircularProgressIndicator())),
        ),
      ),
    );
  }

  Widget resultItem(context, qiitaData) {
    // 記事のタイトル
    String title = qiitaData.title.toString();
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(1.5),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
          ),
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ArticleDetailPage(
                  article: qiitaData,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
