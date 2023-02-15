import 'package:common/entities/entity.dart';
import 'package:common/value_objects/text_vo.dart';
import 'package:common/value_objects/uuid_vo.dart';
import 'package:common/value_objects/value_object.dart';
import 'package:result_dart/result_dart.dart';

import 'task.dart';

enum TaskBoardStatus { completed, pending, disable }

class TaskBoard extends Entity {
  final UuidVO id;
  final List<Task> tasks;
  final TaskBoardStatus status;
  final TextVO title;

  TaskBoard({
    required this.id,
    required this.tasks,
    required this.status,
    required this.title,
  });

  factory TaskBoard.empty() {
    return TaskBoard(
      id: UuidVO(''),
      status: TaskBoardStatus.disable,
      tasks: [],
      title: TextVO(''),
    );
  }

  @override
  Validation validator([Object? _]) {
    return id
        .validator() //
        .flatMap(title.validator)
        .flatMap(_validateTasks);
  }

  Validation _validateTasks([Object? _]) {
    return tasks.fold<Validation>(Success(unit), (value, task) {
      return value.flatMap(task.validator);
    });
  }
}
