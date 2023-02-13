import 'package:flutter/material.dart';

class EditTaskBoardPage extends StatefulWidget {
  const EditTaskBoardPage({Key? key}) : super(key: key);

  @override
  State<EditTaskBoardPage> createState() => _EditTaskBoardPageState();
}

class _EditTaskBoardPageState extends State<EditTaskBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Board'),
      ),
      body: Container(),
    );
  }
}
