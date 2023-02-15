import 'package:common/common.dart';
import 'package:result_dart/result_dart.dart';

import '../exceptions/exception.dart';
import '../services/taskboard_service.dart';

abstract class CreateBoard {
  AsyncResult<Unit, ListinhaException> call(TaskBoard taskBoard);
}

class CreateBoardImpl implements CreateBoard {
  final TaskBoardService service;

  CreateBoardImpl(this.service);

  @override
  AsyncResult<Unit, ListinhaException> call(TaskBoard taskBoard) {
    return taskBoard
        .validator() //
        .mapError<ListinhaException>(InvalidParams.new)
        .toAsyncResult()
        .pure(taskBoard)
        .flatMap(service.createBoard);
  }
}
