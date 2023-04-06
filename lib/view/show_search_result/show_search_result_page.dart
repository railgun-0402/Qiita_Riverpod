import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita_application/view/detail_article/detail_article_page.dart';
import 'package:qiita_application/view/search_top/search_top_page.dart';
import 'package:qiita_application/view/settings/setting_top_page.dart';
import 'package:qiita_application/view_model/get_article_list/article_list_view_model.dart';

class ShowSearchResultState extends StatelessWidget {
  const ShowSearchResultState({super.key});

  /// タブの高さ
  static const double tabBarHeight = 10;

  static const tabs = [
    _TabWidget(tabTitle: '人気記事'),
    _TabWidget(tabTitle: '記事検索'),
    _TabWidget(tabTitle: '設定'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Qiita検索表示"),
            bottom: const TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.bolt),
              ),
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.settings)),
            ]),
          ),
          body: const Padding(
            padding: EdgeInsets.only(top: tabBarHeight),
            child: TabBarView(
              children: [
                ShowArticle(),
                SearchArticlePage(),
                SettingTopPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///
/// Riverpodで記事を取得し、表示する
///
class ShowArticle extends ConsumerWidget {
  const ShowArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qiitaDataList = ref.watch(articleListViewModelProvider);
    return Container(
      child: qiitaDataList.when(
          data: (qiitaDataList) {
            return ListView.builder(
              itemCount: qiitaDataList.length,
              itemBuilder: (BuildContext context, int index) {
                final qiitaData = qiitaDataList[index];
                return resultItem(context, qiitaData);
              },
            );
          },
          error: (error, stack) => Text('Error: $error'),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }

  ///
  /// 記事をそれぞれ表示
  ///
  Widget resultItem(context, qiitaData) {
    /// 記事のタイトル
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

///
/// タブの作成
///
class _TabWidget extends StatelessWidget {
  const _TabWidget({Key? key, required this.tabTitle}) : super(key: key);

  /// タブタイトル
  final String tabTitle;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Align(alignment: Alignment.topCenter, child: Text(tabTitle)),
      ),
    );
  }
}
