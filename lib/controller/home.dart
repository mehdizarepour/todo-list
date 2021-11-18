import 'package:flutter/material.dart';
import 'package:global_configs/global_configs.dart';
import 'package:todo_list/model/repository.dart';
import 'package:todo_list/model/task.dart';

class HomeController extends ChangeNotifier {
  final TaskRepository _repository = TaskRepository();
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<TaskModel> tasks = [];
  bool isLoading = false;

  Future getAllTasks() async {
    isLoading = true;
    notifyListeners();

    tasks = await _repository.getAllByUserId(GlobalConfigs().get('userId'));

    isLoading = false;
    notifyListeners();
  }

  Future markTaskAsCompleted(UniqueKey taskUniqueId) async {
    TaskModel task =
        tasks.firstWhere((element) => element.uniqueId == taskUniqueId);

    task.completed = !task.completed;

    await _repository.update(task);

    notifyListeners();
  }

  Future createNewTask(String title) async {
    if (formKey.currentState!.validate()) {
      TaskModel newTask = TaskModel(
        title: title,
        userId: GlobalConfigs().get('userId'),
        completed: false,
      );

      TaskModel res = await _repository.create(newTask);

      tasks.insert(0, res);

      notifyListeners();
    }
  }
}
