// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/order.dart';

// class ApiService {
//   // Adjust the base URL to match your local/dev environment.
//   static const String _baseUrl = 'http://10.0.2.2:3000'; // Android emulator host

//   Future<List<Order>> fetchOrders() async {
//     final uri = Uri.parse('$_baseUrl/orders/feed');
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       final List<dynamic> jsonList = jsonDecode(response.body);
//       return jsonList.map((e) => Order.fromJson(e)).toList();
//     } else {
//       throw Exception('Failed to load orders');
//     }
//   }

//   Future<void> acceptOrder(String id) async {
//     final uri = Uri.parse('$_baseUrl/orders/$id/accept');
//     final response = await http.post(uri);
//     if (response.statusCode != 200) {
//       throw Exception('Accept failed');
//     }
//   }

//   Future<void> rejectOrder(String id) async {
//     final uri = Uri.parse('$_baseUrl/orders/$id/reject');
//     final response = await http.post(uri);
//     if (response.statusCode != 200) {
//       throw Exception('Reject failed');
//     }
//   }

//   Future<Map<String, dynamic>> fetchPartnerInfo() async {
//     final uri = Uri.parse('$_baseUrl/partner/me');
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body) as Map<String, dynamic>;
//     } else {
//       throw Exception('Partner info fetch failed');
//     }
//   }
// }