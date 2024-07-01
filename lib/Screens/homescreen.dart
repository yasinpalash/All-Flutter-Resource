import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../modal_class/todo.dart';
import 'add_todo.dart';
import 'update_todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box<Todo> todoBox;

  @override
  void initState() {
    super.initState();
    todoBox = Hive.box<Todo>('todo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Hive Todos'),
      ),
      body: ValueListenableBuilder(
        valueListenable: todoBox.listenable(),
        builder: (context, Box<Todo> box, widget) {
          if (box.isEmpty) {
            return const Center(
              child: Text(
                'No Todos yet!',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              itemCount: box.length,
              itemBuilder: (context, index) {
                Todo? todo = box.getAt(index);
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Checkbox(
                      value: todo?.isCompleted,
                      onChanged: (value) {
                        Todo newTodo =
                        Todo(title: todo!.title, isCompleted: value!);
                        box.putAt(index, newTodo);
                      },
                    ),
                    title: Text(
                      todo!.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: todo.isCompleted ? Colors.green : Colors.black,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateTodo(
                                  index: index,
                                  todo: todo!,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit, color: Colors.blue),
                        ),
                        IconButton(
                          onPressed: () {
                            _showDeleteConfirmation(context, index);
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodo()),
          );
        },
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Todo'),
        content: const Text('Are you sure you want to delete this todo?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              todoBox.deleteAt(index);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
