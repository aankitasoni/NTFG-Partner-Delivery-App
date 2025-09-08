// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import '../../data/api.dart';
// import 'quick_controller.dart';

// class QuickHomeScreen extends StatelessWidget {
//   const QuickHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<QuickController>(
//       init: QuickController(ApiClient()),
//       builder: (c) => Scaffold(
//         appBar: AppBar(
//           title: const Text('Quick Delivery'),
//           actions: [
//             IconButton(onPressed: c.fetchFeed, icon: const Icon(Icons.refresh)),
//           ],
//         ),
//         body: c.loading.value
//             ? const Center(child: CircularProgressIndicator())
//             : ListView.separated(
//                 padding: EdgeInsets.all(4.w),
//                 itemCount: c.feed.length,
//                 separatorBuilder: (_, __) => SizedBox(height: 2.h),
//                 itemBuilder: (_, i) {
//                   final item = c.feed[i];
//                   return Card(
//                     child: ListTile(
//                       leading: const Icon(Icons.shopping_bag),
//                       title: Text('Order #${item.id} • ${item.items} item(s)'),
//                       subtitle: Text(
//                         'Pickup (${item.pickupLat.toStringAsFixed(2)}, ${item.pickupLng.toStringAsFixed(2)}) → Drop (${item.dropLat.toStringAsFixed(2)}, ${item.dropLng.toStringAsFixed(2)})',
//                       ),
//                       trailing: FilledButton(
//                         onPressed: () {
//                           Get.snackbar('Accepted', 'Order ${item.id} accepted');
//                         },
//                         child: const Text('Accept'),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }
