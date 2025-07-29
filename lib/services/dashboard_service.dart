import 'dart:math';

class DashboardService {
  Future<Map<String, dynamic>> loadDashboardData() async {
    // Simulate API call delay
    await Future.delayed(Duration(seconds: 2));

    return {
      'stats': {
        'customers': 2847,
        'sales': 12122,
        'orders': 2847,
        'pageViews': 2847,
        'products': 2847,
        'catalogs': 2847,
      },
      'chartData': generateChartData(),
      'customerStats': generateCustomerStats(),
    };
  }

  Map<String, dynamic> getDefaultData() {
    return {
      'stats': {
        'customers': 2847,
        'sales': 12122,
        'orders': 2847,
        'pageViews': 2847,
        'products': 2847,
        'catalogs': 2847,
      },
      'chartData': generateChartData(),
      'customerStats': generateCustomerStats(),
    };
  }

  List<Map<String, dynamic>> generateChartData() {
    final random = Random();
    List<Map<String, dynamic>> data = [];
    List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];

    for (int i = 0; i < months.length; i++) {
      data.add({
        'month': months[i],
        'orders': random.nextInt(8) + 2,
        'sales': random.nextInt(8) + 2,
      });
    }
    return data;
  }

  List<Map<String, dynamic>> generateCustomerStats() {
    final random = Random();
    List<Map<String, dynamic>> data = [];
    List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];

    for (int i = 0; i < months.length; i++) {
      data.add({
        'month': months[i],
        'customers': random.nextInt(4000) + 2000,
      });
    }
    return data;
  }
}