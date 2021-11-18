import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todo_list/helpers/request.dart';
import 'package:todo_list/model/task.dart';

class TaskRepository {
  final _request = Request();

  Future<TaskModel> create(TaskModel task) async {
    final res = await _request.post(
      '/todos',
      data: json.encode(task.toJson()),
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    return TaskModel.fromjson(res.data);
  }

  Future<TaskModel> update(TaskModel task) async {
    final res = await _request.put(
      '/todos/${task.id}',
      data: json.encode(task.toJson()),
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    return TaskModel.fromjson(res.data);
  }

  Future<bool> delete(TaskModel task) async {
    await _request.delete('/todos/${task.id}');

    return true;
  }

  Future<TaskModel> getById(int id, int userId) async {
    final res = await _request.get(
      '/todos/$id',
      queryParameters: {'userId': userId},
    );

    return TaskModel.fromjson(res.data);
  }

  Future<List<TaskModel>> getAllByUserId(int userId, {bool? completed}) async {
    final Map<String, dynamic>? _params = {'userId': userId};

    if (completed != null) {
      _params!['completed'] = completed;
    }

    final res = await _request.get(
      '/todos',
      queryParameters: _params,
    );

    return (res.data as List).map((e) => TaskModel.fromjson(e)).toList();
  }
}
