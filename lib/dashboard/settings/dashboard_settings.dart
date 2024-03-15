import 'package:flutter/material.dart';

class DashboardSettings extends StatefulWidget {
  const DashboardSettings({super.key});

  @override
  State<DashboardSettings> createState() => _DashboardSettingsState();
}

class _DashboardSettingsState extends State<DashboardSettings> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Settings"),
    );
  }
}