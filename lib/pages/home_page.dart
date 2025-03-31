import 'package:flutter/material.dart';
import 'package:tasks/pages/bloc/task_bloc.dart';
import 'package:tasks/pages/bloc/task_event.dart';
import 'package:tasks/pages/bloc/task_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TaskBloc _taskBloc;

  @override
  void initState() {
    super.initState();
    _taskBloc = TaskBloc();
    _taskBloc.inputTask.add(GetTasksEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _taskBloc.inputTask.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Tasks Bloc')),
      body: StreamBuilder<TaskState>(
        stream: _taskBloc.outputTask,
        builder: (context, AsyncSnapshot<TaskState> snapshot) {
          final tasks = snapshot.data?.tasks ?? [];
          if (snapshot.data is TaskLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data is TaskLoadedState) {
            return ListView.separated(
              separatorBuilder: (_, __) => const Divider(),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Center(child: Text(tasks[index].title[0])),
                  ),
                  title: Text(tasks[index].title),
                  subtitle: Text(tasks[index].description ?? 'No description'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _taskBloc.inputTask.add(
                        DeleteTaskEvent(id: tasks[index].id),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _taskBloc.inputTask.add(
            PostTaskEvent(title: 'New Task', description: 'New Description'),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
