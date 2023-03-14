import 'package:rx_notifier/rx_notifier.dart';

import '../atom/home_atom.dart';
import '../services/task_board_service.dart';

class HomeReducer extends RxReducer {
  final TaskBoardService service;

  HomeReducer(this.service) {
    on(() => [fetchBoardTasksAction], _fetchBoardTasks);
    on(() => [createTaskBoardAction], _createBoardTask);
    on(() => [createTaskAction], _createTask);
    on(() => [switchTaskCompleteState], _switchTaskComplete);
  }

  void _fetchBoardTasks() {
    taskBoardsState.value = service.fetchAll();
  }

  void _createBoardTask() {
    service.create();
    _fetchBoardTasks();
  }

  void _createTask() {
    final board = selectedBoardTaskState.value;

    if (board == null) {
      return;
    }

    service.createTask(board);

    selectedBoardTaskState.value = board;
  }

  void _switchTaskComplete() {
    final task = switchTaskCompleteState.value;
    if (task == null) {
      return;
    }

    service.switchCompleteTask(task);
    selectedBoardTaskState.value = selectedBoardTaskState.value;
  }
}
