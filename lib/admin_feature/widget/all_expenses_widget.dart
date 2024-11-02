import 'package:admi_dashboard/admin_feature/widget/expense_card.dart';
import 'package:admi_dashboard/admin_feature/widget/text_field.dart';
import 'package:admi_dashboard/admin_feature/widget/transaction_vactor.dart';
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
                  child: ExpenseCard(
                    title: 'Balance',
                    subtitle: 'April 2022',
                    amount: '\$20,129',
                    icon: Icons.account_balance_wallet,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ExpenseCard(
                    title: 'Income',
                    subtitle: 'April 2022',
                    amount: '\$20,129',
                    icon: Icons.attach_money,
                    color: Colors.lightBlue,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ExpenseCard(
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
                        TransactionAvatar(
                            name: 'Madrani Andi',
                            email: 'Madraniedi09@gmail.com'),
                        const SizedBox(width: 8.0),
                        TransactionAvatar(
                            name: 'Josua Nun', email: 'Josh Nuniko@gmail.com'),
                        const SizedBox(width: 8.0),
                        TransactionAvatar(name: 'More', email: ''),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: const [
                        Expanded(child: CustomTextField(label: 'Customer name')),
                        SizedBox(width: 16.0),
                        Expanded(child: CustomTextField(label: 'Customer Email')),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: const [
                        Expanded(child: CustomTextField(label: 'Item name')),
                        SizedBox(width: 16.0),
                        Expanded(
                            child: CustomTextField(
                                label: 'Item amount', hintText: 'USD')),
                      ],
                    ),
                    const SizedBox(height: 16.0),

                  ],

                ),

              ),
            ),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
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
    );
  }
}

