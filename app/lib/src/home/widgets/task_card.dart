import 'package:flutter/material.dart';

import '../../shared/services/realm/models/task_model.dart';

enum TaskCardStatus {
  pending(Icons.access_time, 'Pendente'),
  completed(Icons.check, 'Completa'),
  disabled(Icons.cancel_outlined, 'Desativada');

  final IconData icon;
  final String text;

  const TaskCardStatus(this.icon, this.text);
}

class TaskCard extends StatelessWidget {
  final TaskBoard board;
  final double height;
  final void Function()? onTap;

  const TaskCard({
    super.key,
    required this.board,
    this.height = 130,
    this.onTap,
  });

  String getProgressText(List<Task> tasks) {
    final completes = tasks.where((task) => task.complete).length;
    return '$completes/${tasks.length}';
  }

  TaskCardStatus getStatus(TaskBoard board, double progress) {
    if (!board.enable) {
      return TaskCardStatus.disabled;
    } else if (progress < 1.0) {
      return TaskCardStatus.pending;
    } else {
      return TaskCardStatus.completed;
    }
  }

  Color getBackgroundColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primaryContainer;
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiaryContainer;
      case TaskCardStatus.disabled:
        return theme.colorScheme.errorContainer;
    }
  }

  Color getColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primary;
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiary;
      case TaskCardStatus.disabled:
        return theme.colorScheme.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final progress = board.progress;
    final progressText = getProgressText(board.tasks);
    final title = board.title;
    final status = getStatus(board, progress);

    final statusText = status.text;
    final iconData = status.icon;

    final backgroundColor = getBackgroundColor(status, theme);
    final color = getColor(status, theme);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  iconData,
                  color: theme.iconTheme.color?.withOpacity(0.5),
                ),
                const Spacer(),
                Text(
                  statusText,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (board.tasks.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    color: color,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    progressText,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
