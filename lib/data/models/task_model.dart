class TaskModel {
  final int id;
  final String title;
  final String? description;

  TaskModel({
    required this.id,
    required this.title,
    this.description,
  });
}
