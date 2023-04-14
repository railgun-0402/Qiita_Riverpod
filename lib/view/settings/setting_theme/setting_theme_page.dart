import 'package:flutter/material.dart';
import 'package:qiita_application/view/settings/setting_theme/setting_theme_strings.dart';

class SettingThemePage extends StatelessWidget {
  const SettingThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(settingThemeTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ダークテーマ切り替えボタン
            themeButton(),
          ],
        ),
      ),
    );
  }

  /// テーマ切り替えボタンのウィジェット
  Widget themeButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
      ),
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange[300]!,
              Colors.orange[500]!,
              Colors.orange[700]!,
            ],
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: const Text('Gradient Button'),
      ),
    );
  }
}
