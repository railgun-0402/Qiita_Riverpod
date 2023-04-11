# アプリ概要
## qiita_application (Qiita記事を検索、人気記事閲覧アプリ)

A new Flutter project.

## Name（リポジトリ/プロジェクト/OSSなどの名前）
 
プロジェクト名、リポジトリ名：qiita_application
  
## Features
 
・Qiitaの記事を検索することができる

・アプリを起動すると人気記事のタイトルが表示される

・表示されたタイトルをタップすると、WebViewで記事が表示される

・記事を検索した際、ヒットしない場合は「記事が見つかりません」と表示される

・スクロールしても記事が続けて出てくる

・オプションで自分の記事が外部ブラウザで表示できる

・バージョン情報の確認
 
## Requirement
 
使用したライブラリ
 
### 状態管理
* flutter_riverpod 2.3.2
* freezed_annotation 2.2.0

### API周り
* dio 5.1.0
* http 0.13.5

### WebView
* webview_flutter 2.0.8
* url_launcher 6.1.0

### test
* json_serializable 6.6.1
* flutter_lints 2.0.0

## Installation
 
pub.devサイトからインストール 

https://pub.dev/
  
## Note
 
### 追加したい機能

・ダークモードや文字の大きさなどをオプションから変える機能

・人気記事画面で、タイトルだけでなく写真、アイコンなども表示したい

・お気に入り機能を実装したい
 
## 参考文献

・https://zenn.dev/tsuruo/articles/56f3abbb132f90

・https://zenn.dev/maguroburger/articles/use_futureprovider_for_api

・https://zenn.dev/sugitlab/articles/flutter_linter_recommend_sugitlab

