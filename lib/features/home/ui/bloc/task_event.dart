import 'package:tasks/features/home/data/models/task_model.dart';

abstract class TaskEvent {}

class GetTasksEvent extends TaskEvent {}

class PostTaskEvent extends TaskEvent {
  final String title;
  final String ? description;

  PostTaskEvent({required this.title, this.description});
}

class UpdateTaskEvent extends TaskEvent {
  final TaskModel task;

  UpdateTaskEvent({required this.task});
}

class DeleteTaskEvent extends TaskEvent {
  final int id;

  DeleteTaskEvent({required this.id});
}