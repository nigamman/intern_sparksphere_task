import 'package:flutter/material.dart';
import '../utils/number_formatter.dart';

class StatsGrid extends StatelessWidget {
  final Map<String, dynamic> dashboardData;

  const StatsGrid({super.key, required this.dashboardData});

  @override
  Widget build(BuildContext context) {
    final stats = dashboardData['stats'] ?? {};

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.6,
      children: [
        _buildStatCard(
          'Customers',
          '${stats['customers'] ?? 0}',
          Icons.people,
          Colors.blue,
        ),
        _buildStatCard(
          'Sales',
          '\$${NumberFormatter.formatNumber(stats['sales'] ?? 0)}',
          Icons.trending_up,
          Colors.blue,
        ),
        _buildStatCard(
          'Orders',
          '${stats['orders'] ?? 0}',
          Icons.shopping_cart,
          Colors.blue,
        ),
        _buildStatCard(
          'Page Views',
          '${stats['pageViews'] ?? 0}',
          Icons.visibility,
          Colors.blue,
        ),
        _buildStatCard(
          'Products',
          '${stats['products'] ?? 0}',
          Icons.inventory,
          Colors.blue,
        ),
        _buildStatCard(
          'Catalogs',
          '${stats['catalogs'] ?? 0}',
          Icons.folder,
          Colors.blue,
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                icon,
                color: color,
                size: 24,
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}