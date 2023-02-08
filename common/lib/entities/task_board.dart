import 'task.dart';

enum TaskBoardStatus { completed, pending, disable }

class TaskBoard {
  final String id;
  final List<Task> tasks;
  final TaskBoardStatus status;
  final String title;

  TaskBoard({
    required this.id,
    required this.tasks,
    required this.status,
    required this.title,
  });
}
