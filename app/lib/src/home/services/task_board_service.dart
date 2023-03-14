import 'package:listinha/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

abstract class TaskBoardService {
  List<TaskBoard> fetchAll();
  void create();
  void createTask(TaskBoard board);
  void switchCompleteTask(Task task);
}

class RealmTaskBoardService implements TaskBoardService {
  final Realm realm;

  RealmTaskBoardService(this.realm);

  @override
  void create() {
    realm.write(() {
      realm.add(
        TaskBoard(
          Uuid.v4(),
          'Nova lista de tarefas',
        ),
      );
    });
  }

  @override
  List<TaskBoard> fetchAll() {
    return realm.all<TaskBoard>().toList();
  }

  @override
  void createTask(TaskBoard board) {
    realm.write(() {
      board.tasks.add(Task(Uuid.v4(), 'Nova tarefa'));
    });
  }

  @override
  void switchCompleteTask(Task task) {
    realm.write(() {
      task.complete = !task.complete;
    });
  }
}
