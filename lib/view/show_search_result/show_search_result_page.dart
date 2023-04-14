import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita_application/view/detail_article/detail_article_page.dart';
import 'package:qiita_application/view/search_top/search_top_page.dart';
import 'package:qiita_application/view/settings/setting_top_page.dart';
import 'package:qiita_application/view/show_search_result/show_search_result_strings.dart';
import 'package:qiita_application/view_model/get_article_list/article_list_view_model.dart';

// アプリ全体の外観モードの状態を管理するプロバイダー
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

class ShowSearchResultState extends ConsumerWidget {
  const ShowSearchResultState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      title: 'Brightness Demo',
      themeMode: themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ShowSearchResultPage(),
    );
  }
}

///
/// 記事取得結果のページ
///
class ShowSearchResultPage extends ConsumerWidget {
  const ShowSearchResultPage({Key? key}) : super(key: key);

  /// タブの高さ
  static const double tabBarHeight = 10;

  static const tabs = [
    _TabWidget(tabTitle: popularTabTitle),
    _TabWidget(tabTitle: searchArticleTabTitle),
    _TabWidget(tabTitle: settingTabTitle),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider.notifier);
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(screenTitle),

          /// テーマの設定ボタン
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: PopupMenuButton<ThemeMode>(
                icon: const Icon(Icons.emoji_objects),
                onSelected: (ThemeMode selectedThemeMode) =>
                    themeMode.state = selectedThemeMode,
                itemBuilder: (context) => <PopupMenuEntry<ThemeMode>>[
                  const PopupMenuItem(
                    value: ThemeMode.system,
                    child: Text(selectSystemMode),
                  ),
                  const PopupMenuItem(
                    value: ThemeMode.light,
                    child: Text(lightMode),
                  ),
                  const PopupMenuItem(
                    value: ThemeMode.dark,
                    child: Text(darkMode),
                  ),
                ],
              ),
            ),
          ],

          /// タブバー
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.bolt),
            ),
            Tab(icon: Icon(Icons.search)),
            Tab(icon: Icon(Icons.settings)),
          ]),
        ),

        /// body部分
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
          error: (error, stack) => Text('$errorString:$error'),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }

  ///
  /// 記事をそれぞれ表示
  ///
  Widget resultItem(context, qiitaData) {
    /// 記事のタイトル
    String title = qiitaData.title.toString();

    /// 記事のアイコン
    String iconUrl = qiitaData.user.profileImageUrl;
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
          leading: CircleAvatar(
            backgroundImage: NetworkImage(iconUrl),
          ),
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
