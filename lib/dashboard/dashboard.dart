import 'package:flutter/material.dart';
import 'calls/dashboard_call.dart';
import 'chat/dashboard_chat.dart';
import 'contacts/dashboard_contact.dart';
import 'custom_indicator.dart';
import 'settings/dashboard_settings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Widget> contents = const [
    DashboardChats(),
    DashboardCalls(),
    DashboardContacts(),
    DashboardSettings(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: contents.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection(){
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: contents,
          ),
        ],
      ),
      bottomNavigationBar: Container(
          color: Colors.white,
        child: Container(
          height: 55,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFF5B2A9A),
              width: 1,
            ),
          ),
          child: TabBar(
            indicator:  const DotTabIndicator(color: Color(0xFF5B2A9A), radius: 4),
            controller: _tabController,
            tabs: [
             Tab(
                icon: ImageIcon(
                  const AssetImage('assets/icons/message.png'),
                  color: _tabController.index == 0
                      ? const Color(0xFF5B2A9A)
                      : Colors.black,
                ),
              ),
              Tab(
                icon: ImageIcon(
                  const AssetImage('assets/icons/call.png'),
                color: _tabController.index == 1
                      ? const Color(0xFF5B2A9A)
                      : Colors.black,
                      ),
              ),
              Tab(
                icon: ImageIcon(
                  const AssetImage('assets/icons/contact.png'),
                color: _tabController.index == 2
                      ? const Color(0xFF5B2A9A)
                      : Colors.black,
                      ),
              ),
              Tab(
                icon: ImageIcon(
                  const AssetImage('assets/icons/setting.png'),
                color: _tabController.index == 3
                      ? const Color(0xFF5B2A9A)
                      : Colors.black,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
