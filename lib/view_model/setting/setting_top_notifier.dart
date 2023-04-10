import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

@immutable
class CounterData {
  const CounterData({required this.counter});
  final int counter;
}

/// 外部ブラウザーでQiitaページを開く
Future<void> openQiitaPage(String stringUrl) async {
  if (await canLaunchUrlString(stringUrl)) {
    await launchUrlString(
      stringUrl,
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw 'Could not Launch $stringUrl';
  }
}

class SettingTopNotifier extends StateNotifier<CounterData> {
  SettingTopNotifier() : super(const CounterData(counter: 0));

  /// 外部ブラウザーでQiitaページを開く
  Future<void> openQiitaPage(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not Launch $url';
    }
  }
}
