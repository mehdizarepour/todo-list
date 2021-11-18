import 'package:flutter/cupertino.dart';

class TaskModel {
  int? id;
  int userId;
  String title;
  bool completed;

  late UniqueKey uniqueId;

  TaskModel({
    this.id,
    required this.title,
    required this.userId,
    this.completed = false,
  }) {
    uniqueId = UniqueKey();
  }

  TaskModel.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        completed = json['completed'],
        userId = json['userId'],
        uniqueId = UniqueKey();

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'completed': completed,
        'userId': userId,
      };
}
