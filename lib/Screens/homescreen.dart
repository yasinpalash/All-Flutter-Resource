import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box friendBox = Hive.box('friend');
  String? name;
  addFriend() async {
    await friendBox.put('name', "Yasin");
    print('sd');
  }

  getFried() async {
    setState(() {
      name = friendBox.get('name');
    });
  }

  updateFriend() async {
    await friendBox.put('name', "polash");
  }

  deleteFriend() async {
    await friendBox.delete('name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive DataBase'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$name",style: TextStyle(fontSize: 40),),
            ElevatedButton(
              onPressed: () {
                addFriend();
                print('sd');
              },
              child: const Text('Create'),
            ),
            ElevatedButton(
              onPressed: () {
                getFried();
              },
              child: const Text('Read'),
            ),
            ElevatedButton(
              onPressed: () {
                updateFriend();
              },
              child: const Text('Update'),
            ),
            ElevatedButton(
              onPressed: () {
                deleteFriend();
              },
              child: const Text('Deleted'),
            )
          ],
        ),
      ),
    );
  }
}
