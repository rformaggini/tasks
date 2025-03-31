import 'package:tasks/data/models/task_model.dart';

class TaskRepository {
  final List<TaskModel> _tasks = [];

  Future<List<TaskModel>> getTasks() async {
    // Simulate a network call

    _tasks.addAll([
      TaskModel(id: 1, title: 'Task 1', description: 'Description 1'),
      TaskModel(id: 2, title: 'Task 2', description: 'Description 2'),
      TaskModel(id: 3, title: 'Task 3', description: 'Description 3'),
    ]);

    return Future.delayed(const Duration(seconds: 2), () => _tasks);
  }

  Future<List<TaskModel>> addTask(TaskModel task) async {
    // Simulate a network call
    _tasks.add(task);

    return await Future.delayed(const Duration(seconds: 2), () {
      return _tasks;
    });
  }

  Future<List<TaskModel>> updateTask(TaskModel task) async {
    // Simulate a network call
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
    }

    return await Future.delayed(const Duration(seconds: 2), () {
      return _tasks;
    });
  }

  Future<List<TaskModel>> deleteTask(int id) async {
    // Simulate a network call
    _tasks.removeWhere((task) => task.id == id);

    return await Future.delayed(const Duration(seconds: 2), () {
      return _tasks;
    });
  }
}
