import 'package:all_flutter_resource/modal_class/todo.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddTodo extends StatelessWidget {
  AddTodo({super.key});

  TextEditingController titleTEController = TextEditingController();
  Box todoBox = Hive.box<Todo>('todo');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
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
                  label: Text('title'), border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
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
                    Todo newTodo =
                        Todo(title: titleTEController.text, isCompleted: false);
                    todoBox.add(newTodo);
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  'Add ',
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
