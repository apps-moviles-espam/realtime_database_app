import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class InsertScreen extends StatefulWidget {
  const InsertScreen({super.key});

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  late DatabaseReference data;
  late String name;
  late String lastname;

  late String username;

  @override
  Widget build(BuildContext context) {
    data = FirebaseDatabase.instance.ref('users');

    return Scaffold(
      appBar: AppBar(
        title: Text("Insert data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  lastname = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a lastname',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a username',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Map<String, String> user = {
                    'uid': username,
                    'name': name,
                    'lastname': lastname,
                  };
                  data.push().set(user);
                },
                child: const Text("Insert data"))
          ],
        ),
      ),
    );
  }
}
