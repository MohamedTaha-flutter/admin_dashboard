import 'package:admi_dashboard/admin_feature/widget/all_expenses_widget.dart';
import 'package:admi_dashboard/admin_feature/widget/drawer_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final drawerWidth = screenWidth * 0.25;
    final containerWidth = screenWidth * 0.375;

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: drawerWidth,
            child: DrawerWidget(),
          ),
          Expanded(child: ExpensesDashboard()),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card Section
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade400, Colors.blue.shade700],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name card', style: TextStyle(color: Colors.white)),
                      SizedBox(height: 8.0),
                      Text(
                        'Syah Bandi',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        '0918 8124 0042 8129',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 2.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '12/20 - 124',
                        style: TextStyle(color: Colors.white54, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.0),

                // Transaction History Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Transaction History',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('See all', style: TextStyle(color: Colors.blue)),
                  ],
                ),
                SizedBox(height: 12.0),
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _transactionTile('Cash Withdrawal', '\$20,129', Colors.red),
                    _transactionTile(
                        'Landing Page project', '\$2,000', Colors.green),
                    _transactionTile(
                        'Juni Mobile App project', '\$20,129', Colors.green),
                  ],
                ),
                SizedBox(height: 24.0),

                // Income Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Income',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Monthly', style: TextStyle(color: Colors.blue)),
                  ],
                ),
                SizedBox(height: 12.0),
                SizedBox(
                  height: 150,
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                            color: Colors.blue, value: 40, title: '40%'),
                        PieChartSectionData(
                            color: Colors.orange, value: 25, title: '25%'),
                        PieChartSectionData(
                            color: Colors.green, value: 20, title: '20%'),
                        PieChartSectionData(
                            color: Colors.grey, value: 15, title: '15%'),
                      ],
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 2,
                      centerSpaceRadius: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

ListTile _transactionTile(String title, String amount, Color color) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(vertical: 4.0),
    title: Text(title, style: TextStyle(fontSize: 16)),
    subtitle: Text('13 Apr, 2022 at 3:30 PM', style: TextStyle(fontSize: 14)),
    trailing: Text(
      amount,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
    ),
  );
}
