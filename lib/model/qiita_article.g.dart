// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qiita_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QiitaArticle _$$_QiitaArticleFromJson(Map<String, dynamic> json) =>
    _$_QiitaArticle(
      title: json['title'] as String?,
      url: json['url'] as String?,
      user: json['user'] == null
          ? null
          : QiitaUser.fromJson(json['user'] as Map<String, dynamic>),
      tags: json['tags'] as List<dynamic>?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$_QiitaArticleToJson(_$_QiitaArticle instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'user': instance.user,
      'tags': instance.tags,
      'created_at': instance.createdAt,
    };
