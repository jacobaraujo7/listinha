import 'package:rx_notifier/rx_notifier.dart';

import '../../shared/services/realm/models/task_model.dart';

// atom
final taskBoardsState = RxNotifier<List<TaskBoard>>([]);
final taskBoardStatusState = RxNotifier<TaskBoardStatus>(TaskBoardStatus.pending);

// computed
List<TaskBoard> get filteredBoardTaskState {
  final status = taskBoardStatusState.value;
  final boards = taskBoardsState.value;

  if (status == TaskBoardStatus.all) {
    return boards;
  }

  return boards.where((board) => board.status == status).toList();
}

// action
final selectedBoardTaskState = RxNotifier<TaskBoard?>(null);
final switchTaskCompleteState = RxNotifier<Task?>(null);
final fetchBoardTasksAction = RxAction();
final createTaskBoardAction = RxAction();
final createTaskAction = RxAction();
