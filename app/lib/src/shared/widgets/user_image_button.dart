import 'package:flutter/material.dart';

class UserImageButton extends StatelessWidget {
  const UserImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        child: const Text('A'),
      ),
    );
  }
}
