import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Tasks Bloc')),
      body: ListView.separated(
        separatorBuilder: (_, __) => const Divider(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Center(child: Text(index.toString()))),
            title: Text('Task $index'),
            subtitle: Text('Description of task $index'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // Handle delete action
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add task action
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
