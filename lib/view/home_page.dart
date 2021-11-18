import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/controller/home.dart';
import 'package:todo_list/theme/app_theme.dart';

import 'widgets/task_input_widget.dart';
import 'widgets/task_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _pageController;
  final TextEditingController editorController = TextEditingController();

  @override
  void initState() {
    _pageController = HomeController()..getAllTasks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _pageController,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Todo List',
              style: TextStyle(
                color: AppTheme.of(context).colorScheme.textPrimary,
              ),
            ),
          ),
          elevation: 0,
        ),
        backgroundColor: AppTheme.of(context).colorScheme.background,
        body: Consumer<HomeController>(
          builder: (context, controller, child) {
            if (controller.isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppTheme.of(context).colorScheme.primary,
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              itemCount: controller.tasks.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 9),
                    child: Form(
                      key: controller.formKey,
                      child: TaskInputWidget(
                        controller: editorController,
                        validator: (value) => value!.isEmpty ? '' : null,
                        onFieldSubmitted: (value) {
                          controller.createNewTask(value);
                          editorController.text = '';
                        },
                      ),
                    ),
                  );
                }

                print(controller.tasks[index - 1].toJson());
                return Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: TaskWidget(
                    uniqueId: controller.tasks[index - 1].uniqueId,
                    title: controller.tasks[index - 1].title,
                    completed: controller.tasks[index - 1].completed,
                    onComplete: controller.markTaskAsCompleted,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
