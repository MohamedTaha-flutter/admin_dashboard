import 'package:admi_dashboard/admin_feature/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MobileView"),
      ),
      drawer: DrawerWidget(),
    );
  }
}
