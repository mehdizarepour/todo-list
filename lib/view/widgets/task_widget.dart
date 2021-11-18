import 'package:flutter/material.dart';
import 'package:todo_list/theme/app_theme.dart';
import 'package:todo_list/theme/app_theme_data.dart';
import 'package:todo_list/view/widgets/badge_widget.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    Key? key,
    required this.uniqueId,
    required this.title,
    required this.onComplete,
    this.completed = false,
  }) : super(key: key);

  final UniqueKey uniqueId;
  final String title;
  final bool completed;
  final void Function(UniqueKey) onComplete;

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  late bool _completed;

  @override
  void initState() {
    _completed = widget.completed;

    super.initState();
  }

  @override
  void didUpdateWidget(TaskWidget oldWidget) {
    _completed = widget.completed;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _completed ? 0.5 : 1.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        padding: const EdgeInsets.only(right: 13.0),
        clipBehavior: Clip.hardEdge,
        height: 80,
        constraints: const BoxConstraints(maxWidth: 386),
        decoration: BoxDecoration(
          color: AppTheme.of(context).colorScheme.backgroundSecondary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppTheme.of(context)
                  .colorScheme
                  .textSecondary
                  .withOpacity(0.1),
              blurRadius: 11,
              offset: const Offset(3, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              splashRadius: 20,
              onPressed: () {
                setState(() {
                  _completed = !_completed;
                });

                widget.onComplete(widget.uniqueId);
              },
              icon: Icon(
                _completed ? Icons.circle_rounded : Icons.circle_outlined,
                color: AppTheme.of(context).colorScheme.textPrimary,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.of(context).typography(
                      TextType.headline5,
                      style: TextStyle(
                        decoration: _completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  BadgeWidget(
                    color: _completed
                        ? AppTheme.of(context).colorScheme.danger
                        : AppTheme.of(context).colorScheme.success,
                    lable: _completed ? 'Done' : 'Inprogress',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
