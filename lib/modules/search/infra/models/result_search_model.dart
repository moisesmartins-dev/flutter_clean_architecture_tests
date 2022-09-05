import 'package:flutter_clean_architecture/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String title;
  final String img;
  final String content;

  ResultSearchModel({
    required this.title,
    required this.img,
    required this.content,
  }) : super(
          title: title,
          img: img,
          content: content,
        );

  Map<String, dynamic> toMap() {
    return {
      'login': title,
      'avatar_url': img,
      'url': content,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      title: map['login'] as String,
      img: map['avatar_url'] as String,
      content: map['url'] as String,
    );
  }
}
