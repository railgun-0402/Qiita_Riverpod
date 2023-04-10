import 'package:flutter/material.dart';

class SettingTopPage extends StatelessWidget {
  SettingTopPage({Key? key}) : super(key: key);

  /// タブの高さ
  static const double tabBarHeight = 10;

  final settingItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return showSettingItem(context, 'title');
          },
        ),

        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: ListView(
        //     shrinkWrap: true,
        //     physics: const NeverScrollableScrollPhysics(),
        //     children: const <Widget>[
        //       Card(
        //         child: ListTile(
        //           title: Text('title'),
        //         ),
        //       ),
        //     ],
        //     // child: Column(
        //     //   children: const [
        //     //     SizedBox(height: 10),
        //     //     SettingHeadLine(title: 'title'),
        //     //   ],
        //     // ),
        //   ),
        // ),
      ),
    );
  }

  ///
  /// 設定をそれぞれ表示
  ///
  Widget showSettingItem(context, title) {
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
              fontSize: 18,
            ),
          ),
          onTap: () {
            print('設定押下');
          },
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
