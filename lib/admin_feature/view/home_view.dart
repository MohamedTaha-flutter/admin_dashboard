import 'package:admi_dashboard/admin_feature/view/desktop_view.dart';
import 'package:admi_dashboard/admin_feature/view/mobile_view.dart';
import 'package:admi_dashboard/admin_feature/view/tablet_view.dart';
import 'package:admi_dashboard/admin_feature/widget/adaptive_layout_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context)=> MobileView(),
        tabletLayout:  (context)=> TabletView(),
        desktopLayout:  (context)=> DesktopView(),
      ),
    );
  }
}
