import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leaf/models/user_model.dart';

class PostModel {
  final String? id;
  final String? title;
  final String? summary;
  final String? body;
  final String? imageURL;
  final DateTime? postTime;
  final int? reacts;
  final int? views;
  final UserModel? author;

  const PostModel({
    @required this.id,
    @required this.title,
    @required this.summary,
    @required this.body,
    @required this.imageURL,
    @required this.author,
    @required this.postTime,
    @required this.reacts,
    @required this.views,
  });
  String get postTimeFormatted => DateFormat.yMMMMEEEEd().format(postTime!);
}
