import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita_application/view/detail_article/detail_article_page.dart';
import 'package:qiita_application/view/search_top/search_top_strings.dart';
import 'package:qiita_application/view_model/get_article_list/article_list_view_model.dart';

class SearchArticleTopPage extends ConsumerStatefulWidget {
  const SearchArticleTopPage({super.key});

  @override
  ConsumerState<SearchArticleTopPage> createState() =>
      SearchArticleTopPageState();
}

class SearchArticleTopPageState extends ConsumerState<SearchArticleTopPage> {
  /// 検索バー
  late TextEditingController _searchController;

  final searchState = StateProvider((_) => '');

  /// テキストフィールドのPadding
  static const double textFieldPadding = 2;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _searchController = TextEditingController(text: ref.read(searchState));
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 検索バーの値
    String searchWordNotifier = ref.read(searchState.notifier).state;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (primaryFocus!.hasFocus) {
          primaryFocus?.unfocus();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            _SearchBar(
              searchKeywordController: _searchController,
            ),
            // TextButton(
            //   onPressed: () {
            //     FocusManager.instance.primaryFocus?.unfocus();
            //   },
            //   child: Text('Close Keyboard'),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(textFieldPadding),
            //   child: TextField(
            //     controller: searchController,
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       contentPadding: EdgeInsets.only(left: 10),
            //       hintText: hintText,
            //     ),
            //     onChanged: (value) {
            //       ref.read(searchState.notifier).update((state) => value);
            //     },
            //     // 決定時
            //     onSubmitted: (searchKeyword) =>
            //         _submission(searchKeyword, context),
            //   ),
            // ),
            // ShowArticle(searchWordNotifier),
          ],
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

class _SearchBar extends StatefulWidget {
  const _SearchBar({
    Key? key,
    required TextEditingController searchKeywordController
  }) : _searchKeywordController = searchKeywordController,
        super(key: key);

  /// 検索バーのController
  final TextEditingController? _searchKeywordController;

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  /// フォーカス設定
  final FocusNode _focusNode = FocusNode();

  /// テキストフィールドのPadding
  static const double textFieldPadding = 5;

  /// 画面遷移後のフォーカス
  final bool _autoFocus = true;

  /// 検索バーのController
  // late TextEditingController? _searchKeywordController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        // フォーカスが当てられた時
        print('フォーカスされた');
      } else {
        print('フォーカスが外された');
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(textFieldPadding),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              focusNode: _focusNode,
              decoration: const InputDecoration(
                hintText: hintText,
                prefixIcon: Icon(
                  Icons.search,
                ),
                border: OutlineInputBorder(),
              ),
              // autofocus: _autoFocus,
              // controller: _searchKeywordController,
            ),
          ),
          const _CancelButton(),
        ],
      ),
    );
  }
}

/// キャンセルボタン
class _CancelButton extends StatelessWidget {
  const _CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => print('キャンセル押下'),
        child: const Text(
          'キャンセル',
          style: TextStyle(color: Colors.blue),
        ),
    );
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
