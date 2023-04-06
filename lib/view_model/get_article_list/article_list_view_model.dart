import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita_application/api/qiita_repository.dart';
import 'package:qiita_application/api/search_qiita_ripository.dart';

/// Qiitaの人気記事を取得する
final articleListViewModelProvider =
    FutureProvider.autoDispose<dynamic>((ref) async {
  final qiitaDataList = await fetchQiitaArticles();
  return qiitaDataList;
});

/// Qiitaの記事を検索付きで取得する
final searchQiitaProvider =
    FutureProvider.autoDispose.family<dynamic, String>((ref, query) async {
  final response = await searchQiitaArticles(query);
  return response;
});

class RepositoryListViewModel extends StateNotifier<AsyncValue<List<dynamic>>> {
  RepositoryListViewModel(super.state);

  Future<void> searchRepositories(String searchKeyword) async {
    if (searchKeyword.isEmpty) {
      return;
    }

    state = const AsyncValue.loading();
    try {
      final repositoryList = await searchQiitaArticles(searchKeyword);
      state = AsyncValue.data(repositoryList);
    } on Exception catch (error) {
      state = AsyncValue.error(error, StackTrace as StackTrace);
    }
  }
}
