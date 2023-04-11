import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita_application/view/settings/setting_top_strings.dart';
import 'package:qiita_application/view_model/setting/setting_top_notifier.dart';

class SettingTopPage extends StatelessWidget {
  const SettingTopPage({Key? key}) : super(key: key);

  /// タブの高さ
  static const double tabBarHeight = 10;

  /// 間の大きさ
  static const double height = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const <Widget>[
              /// ヘッダー
              SettingHeadLine(title: settingHeadLine),

              /// バージョン情報
              SettingVersion(title: settingVersion),
              SizedBox(height: height),

              /// UI設定
              SettingHeadLine(title: headerUISetting),
              SizedBox(height: height),
              // テーマの切り替え
              SettingVersion(title: titleTheme),
              SizedBox(height: height),
              // 記事サイズの変更
              SettingVersion(title: titleStrSize),
              SizedBox(height: height),

              /// その他の設定
              SettingHeadLine(title: headerSetting),
              SizedBox(height: height),
              // 自分の記事を開く
              OpenMyPage(title: titleOpenMyPage),
              // 規約
              SettingVersion(title: titleRule),
              // お知らせ
              SettingVersion(title: titleInformation),
            ],
          ),
        ),
      ),
    );
  }
}

/// アプリのバージョンを示す
class SettingVersion extends StatelessWidget {
  const SettingVersion({Key? key, required this.title}) : super(key: key);
  final String title;
  final String appVer = '1.0.0';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(1.5),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1.2,
            ),
          ),
        ),
        child: ListTile(
          leading: const Icon(Icons.bolt),
          trailing: Text(
            appVer,
            style: const TextStyle(
              color: Colors.teal,
              fontSize: 16,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }
}

class SettingHeadLine extends StatelessWidget {
  const SettingHeadLine({Key? key, required this.title}) : super(key: key);

  /// タイトル
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title),
    );
  }
}

/// 自分の記事を開く
class OpenMyPage extends ConsumerWidget {
  const OpenMyPage({Key? key, required this.title}) : super(key: key);
  final String title;

  /// 自分の記事サンプルurl
  static const String stringUri = 'https://qiita.com/railgun-0402';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          leading: const Icon(Icons.auto_stories),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w100,
            ),
          ),
          onTap: () {
            openQiitaPage(stringUri);
          },
        ),
      ),
    );
  }
}
