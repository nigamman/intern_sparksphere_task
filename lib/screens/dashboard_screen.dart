import 'package:flutter/material.dart';
import '../widgets/dashboard_content.dart';
import '../screens/coming_soon_screen.dart';
import '../services/dashboard_service.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isLoading = true;
  Map<String, dynamic> dashboardData = {};
  int currentBottomNavIndex = 0;
  final DashboardService _dashboardService = DashboardService();

  @override
  void initState() {
    super.initState();
    loadDashboardData();
  }

  Future<void> loadDashboardData() async {
    setState(() {
      isLoading = true;
    });

    try {
      dashboardData = await _dashboardService.loadDashboardData();
    } catch (e) {
      print('Error loading data: $e');
      dashboardData = _dashboardService.getDefaultData();
    }

    setState(() {
      isLoading = false;
    });
  }

  List<Widget> _screens() => [
    DashboardContent(dashboardData: dashboardData),
    const ComingSoonScreen(sectionName: 'Catalogs'),
    const ComingSoonScreen(sectionName: 'Orders'),
    const ComingSoonScreen(sectionName: 'Customers'),
    const ComingSoonScreen(sectionName: 'Analytics'),
    const ComingSoonScreen(sectionName: 'Reports'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: isLoading
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 12),
            Text("Loading Dashboard..."),
          ],
        ),
      )
          : SafeArea(
        child: IndexedStack(
          index: currentBottomNavIndex,
          children: _screens(),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentBottomNavIndex,
      onTap: (index) {
        setState(() {
          currentBottomNavIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey[400],
      backgroundColor: Colors.white,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Catalogs'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Orders'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Customers'),
        BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
        BottomNavigationBarItem(icon: Icon(Icons.assessment), label: 'Reports'),
      ],
    );
  }
}