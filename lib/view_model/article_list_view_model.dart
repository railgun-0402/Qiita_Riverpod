import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita_application/api/qiita_repository.dart';

final articleListViewModelProvider =
    FutureProvider.autoDispose<dynamic>((ref) async {
  final qiitaDataList = await fetchQiitaArticles();
  return qiitaDataList;
});
