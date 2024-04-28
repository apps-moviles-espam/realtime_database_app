import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:realtime_database_app/screens/detail_screen.dart';
import 'package:realtime_database_app/screens/insert_screen.dart';
import 'package:realtime_database_app/widgets/item_widget.dart';

class ListScreen extends StatefulWidget {
  ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  void showDetail(String user) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailScreen(
        user: user,
      );
    }));
  }

  void insertScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return InsertScreen();
    }));
  }

  final data = FirebaseDatabase.instance.ref('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Realtime Database"),
      ),
      body: FirebaseAnimatedList(
          query: data,
          itemBuilder: (context, snapshot, animation, index) {
            return ItemWidget(
              name: snapshot.child('name').value.toString(),
              lastname: snapshot.child('lastname').value.toString(),
              id: snapshot.child('uid').value.toString(),
              onTap: showDetail,
              username: snapshot.key.toString(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          insertScreen();
        },
      ),
    );
  }
}
