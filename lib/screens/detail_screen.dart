import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String user;

  const DetailScreen({
    super.key,
    required this.user,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late DatabaseReference data;

  late String name = "";
  late String lastname = "";

  @override
  Widget build(BuildContext context) {
    data = FirebaseDatabase.instance.ref('users/${widget.user}');
    data.onValue.listen((event) {
      setState(() {
        name = event.snapshot.child('name').value.toString();
        lastname = event.snapshot.child('lastname').value.toString();
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(data.key.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data.key.toString()),
            Text(name),
            Text(lastname),
          ],
        ),
      ),
    );
  }
}
