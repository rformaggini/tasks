import 'dart:async';
import 'dart:math';

import 'package:tasks/data/models/task_model.dart';
import 'package:tasks/data/repositories/task_repository.dart';
import 'package:tasks/pages/bloc/task_event.dart';
import 'package:tasks/pages/bloc/task_state.dart';

class TaskBloc {
  final TaskRepository _taskRepository = TaskRepository();

  final StreamController<TaskEvent> _inputTaskController =
      StreamController<TaskEvent>();
  final StreamController<TaskState> _outputTaskController =
      StreamController<TaskState>();

  Sink<TaskEvent> get inputTask => _inputTaskController.sink;
  Stream<TaskState> get outputTask => _outputTaskController.stream;

  TaskBloc() {
    _inputTaskController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TaskEvent event) async {
    List<TaskModel> tasks = [];
    _outputTaskController.add(TaskLoadingState());

    if (event is GetTasksEvent) {
      try {
        tasks = await _taskRepository.getTasks();
        _outputTaskController.add(TaskLoadedState(tasks: tasks));
      } catch (e) {
        _outputTaskController.add(TaskErrorState(exception: e as Exception));
      }
    } else if (event is PostTaskEvent) {
      try {
        tasks = await _taskRepository.addTask(
          TaskModel(
            id: Random().nextInt(100),
            title: event.title,
            description: event.description,
          ),
        );
        _outputTaskController.add(TaskLoadedState(tasks: tasks));
      } catch (e) {
        _outputTaskController.add(TaskErrorState(exception: e as Exception));
      }
    } else if (event is UpdateTaskEvent) {
      try {
        tasks = await _taskRepository.updateTask(event.task);
        _outputTaskController.add(TaskLoadedState(tasks: tasks));
      } catch (e) {
        _outputTaskController.add(TaskErrorState(exception: e as Exception));
      }
    } else if (event is DeleteTaskEvent) {
      try {
        tasks = await _taskRepository.deleteTask(event.id);
        _outputTaskController.add(TaskLoadedState(tasks: tasks));
      } catch (e) {
        _outputTaskController.add(TaskErrorState(exception: e as Exception));
      }
    }
  }
}
