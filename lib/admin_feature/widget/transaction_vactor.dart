import 'package:flutter/material.dart';

class TransactionAvatar extends StatelessWidget {
  final String name;
  final String email;

  const TransactionAvatar({super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 20,
          child: Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(height: 4.0),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(name,
                style:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            Text(email,
                style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
