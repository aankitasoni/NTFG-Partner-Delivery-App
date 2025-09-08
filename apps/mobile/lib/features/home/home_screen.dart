// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import '../../widgets/delivery_option_tile.dart';
// import '../../core/routes.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Choose Delivery Type')),
//       body: Padding(
//         padding: EdgeInsets.all(4.w),
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: DeliveryOptionTile(
//                   title: 'Quick Delivery',
//                   subtitle: 'Blinkit-style \n~10–30 min',
//                   icon: Icons.bolt,
//                   gradient: const LinearGradient(
//                     colors: [Color(0xFFFFD54F), Color(0xFFFFB300)],
//                   ),
//                   onTap: () => Get.toNamed(Routes.quick),
//                 ),
//               ),
//               SizedBox(width: 4.w),
//               Expanded(
//                 child: DeliveryOptionTile(
//                   title: 'Normal Delivery',
//                   subtitle: 'Flipkart-style \n1–3 days',
//                   icon: Icons.local_shipping,
//                   gradient: const LinearGradient(
//                     colors: [Color(0xFF64B5F6), Color(0xFF1976D2)],
//                   ),
//                   onTap: () => Get.toNamed(Routes.normal),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
