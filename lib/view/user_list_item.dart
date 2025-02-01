import 'package:flutter/material.dart';
import '../model/user.dart';


class UserListItem extends StatelessWidget {
  final User user;

  const UserListItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.picture),
              radius: 30,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("Age: ${user.age}"),
                  Text("City: ${user.city}"),
                  Text("Phone: ${user.phone}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
