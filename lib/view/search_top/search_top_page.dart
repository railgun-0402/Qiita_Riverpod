import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita_application/view/detail_article/detail_article_page.dart';
import 'package:qiita_application/view/search_top/search_top_strings.dart';
import 'package:qiita_application/view_model/get_article_list/article_list_view_model.dart';

class SearchArticlePage extends ConsumerWidget {
  const SearchArticlePage({super.key});

  @override
  Widget build(context, ref) {
    return const MaterialApp(
      home: Scaffold(
        body: SearchArticleTopPage(),
      ),
    );
  }
}

class SearchArticleTopPage extends ConsumerStatefulWidget {
  const SearchArticleTopPage({super.key});

  @override
  ConsumerState<SearchArticleTopPage> createState() =>
      SearchArticleTopPageState();
}

class SearchArticleTopPageState extends ConsumerState<SearchArticleTopPage> {
  /// 検索バー
  late TextEditingController searchController;

  final searchState = StateProvider((_) => '');

  /// テキストフィールドのPadding
  static const double textFieldPadding = 2;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController(text: ref.read(searchState));
  }

  @override
  Widget build(BuildContext context) {
    /// 検索バーの値
    String searchWordNotifier = ref.read(searchState.notifier).state;

    return Focus(
      child: GestureDetector(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(textFieldPadding),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: hintText,
                  ),
                  onChanged: (value) {
                    ref.read(searchState.notifier).update((state) => value);
                  },
                  onSubmitted: (searchKeyword) =>
                      _submission(searchKeyword, context),
                ),
              ),
              ShowArticle(searchWordNotifier),
            ],
          ),
        ),
      ),
    );
  }

  void _submission(String searchKeyword, BuildContext context) {
    ref
        .read(RepositoryListViewModel as ProviderListenable)
        .searchRepositories(searchKeyword);
  }
}

///
/// Riverpodで記事を取得し、表示する
///
class ShowArticle extends ConsumerWidget {
  const ShowArticle(this.searchWord, {Key? key}) : super(key: key);
  final String searchWord;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQiitaList = ref.watch(searchQiitaProvider(searchWord));
    return Container(
      child: searchQiitaList.when(
          data: (qiitaDataList) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
