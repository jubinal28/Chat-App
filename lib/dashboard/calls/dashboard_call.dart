import 'package:flutter/material.dart';

class DashboardCalls extends StatefulWidget {
  const DashboardCalls({super.key});

  @override
  State<DashboardCalls> createState() => _DashboardCallsState();
}

class _DashboardCallsState extends State<DashboardCalls> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Calls"),
    );
  }
}