import 'package:admi_dashboard/admin_feature/widget/all_expenses_widget.dart';
import 'package:admi_dashboard/admin_feature/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    // عرض الشاشة الكامل
    final screenWidth = MediaQuery.of(context).size.width;

    // حساب عرض كل عنصر بحيث يتم توزيعهم بالتساوي
    final drawerWidth = screenWidth * 0.25; // 30% لـ Drawer
    final containerWidth = screenWidth * 0.375; // 35% لكل Container

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: drawerWidth,
            child: DrawerWidget(),
          ),
          SizedBox(
            width: containerWidth,
            child: ExpensesDashboard(),
          ),
          Container(
            width: containerWidth,
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
