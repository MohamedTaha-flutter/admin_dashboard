import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final IconData icon;
  final Color color;

  const ExpenseCard({super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  child: Icon(icon, color: Colors.white),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black12,
                )
              ],
            ),
            const SizedBox(height: 16.0),
            Text(title,
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            Text(subtitle,
                style: const TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 8.0),
            Text(amount,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
