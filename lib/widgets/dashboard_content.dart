import 'package:flutter/material.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/stats_grid.dart';
import '../widgets/order_sale_stats.dart';
import '../widgets/customer_stats.dart';

class DashboardContent extends StatelessWidget {
  final Map<String, dynamic> dashboardData;

  const DashboardContent({super.key, required this.dashboardData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardHeader(),
          const SizedBox(height: 24),
          StatsGrid(dashboardData: dashboardData),
          const SizedBox(height: 32),
          OrderSaleStats(),
          const SizedBox(height: 32),
          CustomerStats(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}