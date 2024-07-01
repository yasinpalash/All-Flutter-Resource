import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../modal_class/todo.dart';

class UpdateTodo extends StatelessWidget {
  final int index;
  final Todo todo;
  UpdateTodo({required this.index, required this.todo, Key? key}) : super(key: key);

  final TextEditingController titleTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleTEController.text = todo.title;
    Box todoBox = Hive.box<Todo>('todo');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Todo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleTEController,
              decoration: const InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shadowColor: Colors.green,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(0.0),
                ),
                onPressed: () {
                  if (titleTEController.text != '') {
                    Todo updatedTodo = Todo(
                      title: titleTEController.text,
                      isCompleted: todo.isCompleted,
                    );
                    todoBox.putAt(index, updatedTodo);
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  'Update',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
