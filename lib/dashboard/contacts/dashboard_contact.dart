import 'package:flutter/material.dart';

class DashboardContacts extends StatefulWidget {
  const DashboardContacts({super.key});

  @override
  State<DashboardContacts> createState() => _DashboardContactsState();
}

class _DashboardContactsState extends State<DashboardContacts> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Contacts"),
    );
  }
}