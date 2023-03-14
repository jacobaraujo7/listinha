import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../shared/services/realm/models/task_model.dart';
import '../shared/widgets/user_image_button.dart';
import 'atom/home_atom.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchBoardTasksAction();
  }

  @override
  Widget build(BuildContext context) {
    final boards = context.select(() => filteredBoardTaskState);

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('LISTINHA'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton(),
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.only(
                top: 50,
                left: 30,
                right: 30,
                bottom: 200,
              ),
              itemCount: boards.length,
              itemBuilder: (_, index) {
                final board = boards[index];
                return TaskCard(
                  board: board,
                  height: 140,
                  onTap: () async {
                    selectedBoardTaskState.value = board;
                    await Navigator.pushNamed(context, './edit');
                    fetchBoardTasksAction();
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SegmentedButton<TaskBoardStatus>(
                  segments: const [
                    ButtonSegment(
                      value: TaskBoardStatus.all,
                      label: Text('Todos'),
                    ),
                    ButtonSegment(
                      value: TaskBoardStatus.pending,
                      label: Text('Pendentes'),
                    ),
                    ButtonSegment(
                      value: TaskBoardStatus.completed,
                      label: Text('Concluídas'),
                    ),
                    ButtonSegment(
                      value: TaskBoardStatus.disabled,
                      label: Text('Desativadas'),
                    ),
                  ],
                  selected: {taskBoardStatusState.value},
                  onSelectionChanged: (values) {
                    taskBoardStatusState.value = values.first;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.edit),
        label: const Text('Nova Lista'),
        onPressed: createTaskBoardAction.call,
      ),
    );
  }
}
