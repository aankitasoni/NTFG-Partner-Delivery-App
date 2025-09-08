// import 'package:flutter/material.dart';
// import '../models/order.dart';
// import '../services/api_service.dart';

// class OrderTile extends StatefulWidget {
//   final Order order;
//   final ApiService api;

//   const OrderTile({super.key, required this.order, required this.api});

//   @override
//   State<OrderTile> createState() => _OrderTileState();
// }

// class _OrderTileState extends State<OrderTile> {
//   bool _processing = false;

//   Future<void> _handleAction(String action) async {
//     setState(() => _processing = true);
//     try {
//       if (action == 'accept') {
//         await widget.api.acceptOrder(widget.order.id);
//       } else {
//         await widget.api.rejectOrder(widget.order.id);
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Order ${action}ed')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to $action order')),
//       );
//     } finally {
//       setState(() => _processing = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final order = widget.order;
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       child: ListTile(
//         title: Text('Order ${order.id} • ${order.items} item(s)'),
//         subtitle: Text(
//             'Pickup (${order.pickup.lat.toStringAsFixed(4)}, ${order.pickup.lng.toStringAsFixed(4)}) → '
//             'Dropoff (${order.dropoff.lat.toStringAsFixed(4)}, ${order.dropoff.lng.toStringAsFixed(4)})'),
//         trailing: _processing
//             ? const SizedBox(
//                 width: 24,
//                 height: 24,
//                 child: CircularProgressIndicator(strokeWidth: 2),
//               )
//             : Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.check, color: Colors.green),
//                     onPressed: () => _handleAction('accept'),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.close, color: Colors.red),
//                     onPressed: () => _handleAction('reject'),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }