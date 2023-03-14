import 'package:flutter/material.dart';
import 'package:listinha/src/home/atom/home_atom.dart';
import 'package:rx_notifier/rx_notifier.dart';

class EditTaskBoardPage extends StatefulWidget {
  const EditTaskBoardPage({super.key});

  @override
  State<EditTaskBoardPage> createState() => _EditTaskBoardPageState();
}

class _EditTaskBoardPageState extends State<EditTaskBoardPage> {
  @override
  Widget build(BuildContext context) {
    final board = context.select(() => selectedBoardTaskState.value)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTINHA'),
      ),
      body: ListView(
        children: [
          Text(board.title),
          for (var i = 0; i < board.tasks.length; i++)
            CheckboxListTile(
              value: board.tasks[i].complete,
              title: Text(board.tasks[i].description),
              onChanged: (value) {
                switchTaskCompleteState.value = board.tasks[i];
              },
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Novo item'),
        onPressed: createTaskAction,
      ),
    );
  }
}
