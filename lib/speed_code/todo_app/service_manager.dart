import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:only_code/speed_code/todo_app/todo_model.dart';

abstract class ITodoService {
  Future<List<TodoModel>?> fetchTodoItems();
}

class TodoService implements ITodoService {
  final Dio _networkManager;
  TodoService()
      : _networkManager =
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<List<TodoModel>?> fetchTodoItems() async {
    try {
      final response = await _networkManager.get(_TodoServicePath.todos.name);

      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;

        if (data is List) {
          return data.map((e) => TodoModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }
}

enum _TodoServicePath { todos }

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-------');
    }
  }
}
