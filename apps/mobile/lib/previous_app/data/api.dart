// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../data/models.dart';

// class ApiClient {
//   ApiClient({String? baseUrl})
//     : baseUrl =
//           baseUrl ??
//           const String.fromEnvironment(
//             'API_URL',
//             defaultValue: 'http://localhost:3000',
//           );
//   final String baseUrl;

//   Future<List<OrderFeedItem>> getOrderFeed() async {
//     final res = await http.get(Uri.parse('$baseUrl/orders/feed'));
//     if (res.statusCode != 200) throw Exception('Feed failed ${res.statusCode}');
//     final data = jsonDecode(res.body) as List;
//     return data
//         .map((e) => OrderFeedItem.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }
// }
