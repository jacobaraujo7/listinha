import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/home/services/task_board_service.dart';

import 'edit_task_board_page.dart';
import 'home_page.dart';
import 'reducers/home_reducer.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        AutoBind.singleton<HomeReducer>(HomeReducer.new),
        AutoBind.singleton<TaskBoardService>(RealmTaskBoardService.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/edit', child: (context, args) => const EditTaskBoardPage()),
      ];
}
