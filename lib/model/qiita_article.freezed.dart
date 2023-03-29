// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qiita_article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QiitaArticle _$QiitaArticleFromJson(Map<String, dynamic> json) {
  return _QiitaArticle.fromJson(json);
}

/// @nodoc
mixin _$QiitaArticle {
  String? get title => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  QiitaUser? get user => throw _privateConstructorUsedError;
  List<dynamic>? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QiitaArticleCopyWith<QiitaArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QiitaArticleCopyWith<$Res> {
  factory $QiitaArticleCopyWith(
          QiitaArticle value, $Res Function(QiitaArticle) then) =
      _$QiitaArticleCopyWithImpl<$Res, QiitaArticle>;
  @useResult
  $Res call(
      {String? title,
      String? url,
      QiitaUser? user,
      List<dynamic>? tags,
      @JsonKey(name: 'created_at') String? createdAt});

  $QiitaUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$QiitaArticleCopyWithImpl<$Res, $Val extends QiitaArticle>
    implements $QiitaArticleCopyWith<$Res> {
  _$QiitaArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? url = freezed,
    Object? user = freezed,
    Object? tags = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as QiitaUser?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QiitaUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $QiitaUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QiitaArticleCopyWith<$Res>
    implements $QiitaArticleCopyWith<$Res> {
  factory _$$_QiitaArticleCopyWith(
          _$_QiitaArticle value, $Res Function(_$_QiitaArticle) then) =
      __$$_QiitaArticleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? url,
      QiitaUser? user,
      List<dynamic>? tags,
      @JsonKey(name: 'created_at') String? createdAt});

  @override
  $QiitaUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_QiitaArticleCopyWithImpl<$Res>
    extends _$QiitaArticleCopyWithImpl<$Res, _$_QiitaArticle>
    implements _$$_QiitaArticleCopyWith<$Res> {
  __$$_QiitaArticleCopyWithImpl(
      _$_QiitaArticle _value, $Res Function(_$_QiitaArticle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? url = freezed,
    Object? user = freezed,
    Object? tags = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_QiitaArticle(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as QiitaUser?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QiitaArticle implements _QiitaArticle {
  _$_QiitaArticle(
      {this.title,
      this.url,
      this.user,
      final List<dynamic>? tags,
      @JsonKey(name: 'created_at') this.createdAt})
      : _tags = tags;

  factory _$_QiitaArticle.fromJson(Map<String, dynamic> json) =>
      _$$_QiitaArticleFromJson(json);

  @override
  final String? title;
  @override
  final String? url;
  @override
  final QiitaUser? user;
  final List<dynamic>? _tags;
  @override
  List<dynamic>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'QiitaArticle(title: $title, url: $url, user: $user, tags: $tags, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QiitaArticle &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, url, user,
      const DeepCollectionEquality().hash(_tags), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QiitaArticleCopyWith<_$_QiitaArticle> get copyWith =>
      __$$_QiitaArticleCopyWithImpl<_$_QiitaArticle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QiitaArticleToJson(
      this,
    );
  }
}

abstract class _QiitaArticle implements QiitaArticle {
  factory _QiitaArticle(
      {final String? title,
      final String? url,
      final QiitaUser? user,
      final List<dynamic>? tags,
      @JsonKey(name: 'created_at') final String? createdAt}) = _$_QiitaArticle;

  factory _QiitaArticle.fromJson(Map<String, dynamic> json) =
      _$_QiitaArticle.fromJson;

  @override
  String? get title;
  @override
  String? get url;
  @override
  QiitaUser? get user;
  @override
  List<dynamic>? get tags;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_QiitaArticleCopyWith<_$_QiitaArticle> get copyWith =>
      throw _privateConstructorUsedError;
}
