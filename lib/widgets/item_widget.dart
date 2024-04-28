import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget(
      {super.key,
      required this.name,
      required this.lastname,
      required this.id,
      required this.onTap,
      required this.username});
  final String name;
  final String lastname;
  final String id;
  final String username;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(username);
      },
      child: ListTile(
        title: Text(name),
        subtitle: Text(lastname),
        trailing: Text(id),
      ),
    );
  }
}
