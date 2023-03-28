import 'package:flutter/material.dart';
import 'package:qiita_application/ripository.dart';

class ShowSearchResult extends StatefulWidget {
  const ShowSearchResult({Key? key}) : super(key: key);

  @override
  State<ShowSearchResult> createState() => _ShowSearchResultState();
}

class _ShowSearchResultState extends State<ShowSearchResult> {
  @override
  Widget build(BuildContext context) {
    var list = [
      "メッセージ",
      "メッセージ",
      "メッセージ",
      "メッセージ",
      "メッセージ",
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Qiita検索表示"),
        ),
        body: ListView.builder(itemBuilder: (BuildContext context, int index) {
          if (index < list.length) {
            return resultItem(list[index]);
          }
          return null;
          // return resultItem(list[index]);
        }),
      ),
    );
  }

  Widget resultItem(String title) {
    return Container(
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
          print("$titleがTapされました");
          fetchParsonDataList();
        },
        onLongPress: () {
          // 長押し時の処理
          print("$titleが長押しされました");
        },
      ),
    );
  }
}
