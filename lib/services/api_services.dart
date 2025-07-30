import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Fetch users data and transform it to dashboard stats
  static Future<Map<String, dynamic>> fetchDashboardData() async {
    try {

      final futures = await Future.wait([
        http.get(Uri.parse('$baseUrl/users')),
        http.get(Uri.parse('$baseUrl/posts')),
        http.get(Uri.parse('$baseUrl/albums')),
        http.get(Uri.parse('$baseUrl/photos')),
      ]);

      final users = json.decode(futures[0].body) as List;
      final posts = json.decode(futures[1].body) as List;
      final albums = json.decode(futures[2].body) as List;
      final photos = json.decode(futures[3].body) as List;

      final random = Random();

      return {
        'stats': {
          'customers': users.length * 284,
          'sales': random.nextInt(20000) + 10000,
          'orders': posts.length * 28,
          'pageViews': photos.length ~/ 10,
          'products': albums.length * 35,
          'catalogs': users.length * 405,
        },
        'chartData': _generateChartDataFromPosts(posts),
        'customerStats': _generateCustomerStatsFromUsers(users),
        'userProfiles': users.take(5).map((user) => {
          'name': user['name'],
          'email': user['email'],
          'company': user['company']['name'],
        }).toList(),
      };
    } catch (e) {
      print('API Error: $e');

      return _getFallbackData();
    }
  }

  static List<Map<String, dynamic>> _generateChartDataFromPosts(List posts) {
    final random = Random();
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];

    return months.map((month) => {
      'month': month,
      'orders': random.nextInt(8) + 2,
      'sales': random.nextInt(8) + 3,
    }).toList();
  }

  static List<Map<String, dynamic>> _generateCustomerStatsFromUsers(List users) {
    final random = Random();
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];

    return months.map((month) => {
      'month': month,
      'customers': (users.length * 400) + random.nextInt(2000),
    }).toList();
  }

  static Map<String, dynamic> _getFallbackData() {
    final random = Random();

    return {
      'stats': {
        'customers': 2847,
        'sales': 12122,
        'orders': 2847,
        'pageViews': 2847,
        'products': 2847,
        'catalogs': 2847,
      },
      'chartData': List.generate(6, (index) => {
        'month': ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'][index],
        'orders': random.nextInt(8) + 2,
        'sales': random.nextInt(8) + 3,
      }),
      'customerStats': List.generate(6, (index) => {
        'month': ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'][index],
        'customers': 2000 + random.nextInt(4000),
      }),
      'userProfiles': [
        {'name': 'John Doe', 'email': 'john@example.com', 'company': 'Tech Corp'},
        {'name': 'Jane Smith', 'email': 'jane@example.com', 'company': 'Design Co'},
      ],
    };
  }

  static Future<Map<String, int>> fetchLiveStats() async {
    await Future.delayed(Duration(seconds: 1));
    final random = Random();

    return {
      'activeUsers': random.nextInt(500) + 100,
      'todayOrders': random.nextInt(50) + 10,
      'revenue': random.nextInt(5000) + 1000,
    };
  }
}