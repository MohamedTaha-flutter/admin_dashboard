import 'package:flutter/material.dart';

class ExpensesDashboard extends StatefulWidget {
  const ExpensesDashboard({super.key});

  @override
  State<ExpensesDashboard> createState() => _ExpensesDashboardState();
}

class _ExpensesDashboardState extends State<ExpensesDashboard> {
  String selectedValue = 'Monthly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'All Expenses',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: selectedValue,
                  items: <String>['Monthly', 'Weekly', 'Daily']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    }
                  },
                  style: const TextStyle(color: Colors.black),
                  dropdownColor: Colors.white,
                  underline: SizedBox(), // Hide the underline if needed
                )
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: _ExpenseCard(
                    title: 'Balance',
                    subtitle: 'April 2022',
                    amount: '\$20,129',
                    icon: Icons.account_balance_wallet,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _ExpenseCard(
                    title: 'Income',
                    subtitle: 'April 2022',
                    amount: '\$20,129',
                    icon: Icons.attach_money,
                    color: Colors.lightBlue,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _ExpenseCard(
                    title: 'Expenses',
                    subtitle: 'April 2022',
                    amount: '\$20,129',
                    icon: Icons.money_off,
                    color: Colors.lightBlue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            // Quick Invoice Section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Quick Invoice',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Icon(Icons.add_circle, color: Colors.blue),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    const Text('Latest Transaction', style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        _TransactionAvatar(
                            name: 'Madrani Andi',
                            email: 'Madraniedi09@gmail.com'),
                        const SizedBox(width: 8.0),
                        _TransactionAvatar(
                            name: 'Josua Nun', email: 'Josh Nuniko@gmail.com'),
                        const SizedBox(width: 8.0),
                        _TransactionAvatar(name: 'More', email: ''),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: const [
                        Expanded(child: _TextField(label: 'Customer name')),
                        SizedBox(width: 16.0),
                        Expanded(child: _TextField(label: 'Customer Email')),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: const [
                        Expanded(child: _TextField(label: 'Item name')),
                        SizedBox(width: 16.0),
                        Expanded(
                            child: _TextField(
                                label: 'Item amount', hintText: 'USD')),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Add more details',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 12.0),
                          ),
                          child: const Text('Send Money',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Widget for Expense Card
class _ExpenseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final IconData icon;
  final Color color;

  const _ExpenseCard({
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
            CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
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

// Custom Widget for Transaction Avatar
class _TransactionAvatar extends StatelessWidget {
  final String name;
  final String email;

  const _TransactionAvatar({
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 20,
          child: Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(height: 4.0),
        Text(name,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        Text(email, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }
}

// Custom Text Field Widget
class _TextField extends StatelessWidget {
  final String label;
  final String? hintText;

  const _TextField({required this.label, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      ),
    );
  }
}
