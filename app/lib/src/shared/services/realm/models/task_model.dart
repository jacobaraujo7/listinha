import 'package:realm/realm.dart';

part 'task_model.g.dart';

@RealmModel()
class _Task {
  @PrimaryKey()
  late Uuid id;
  late String description;
  bool complete = false;
}

@RealmModel()
class _TaskBoard {
  @PrimaryKey()
  late Uuid id;
  late String title;
  late List<_Task> tasks;
  bool enable = true;
}

extension TaskBoardExtension on TaskBoard {
  double get progress {
    if (tasks.isEmpty) return 0;
    final completes = tasks.where((task) => task.complete).length;
    return completes / tasks.length;
  }

  TaskBoardStatus get status {
    if (!enable) {
      return TaskBoardStatus.disabled;
    } else if (progress < 1.0) {
      return TaskBoardStatus.pending;
    } else {
      return TaskBoardStatus.completed;
    }
  }
}

enum TaskBoardStatus {
  pending,
  completed,
  disabled,
  all,
}
