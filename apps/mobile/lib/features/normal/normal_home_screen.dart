// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'normal_controller.dart';

// class NormalHomeScreen extends StatelessWidget {
//   const NormalHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<NormalController>(
//       init: NormalController(),
//       builder: (c) => Scaffold(
//         appBar: AppBar(title: const Text('Normal Delivery')),
//         body: GridView.builder(
//           padding: EdgeInsets.all(4.w),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 2.h,
//             crossAxisSpacing: 4.w,
//             childAspectRatio: 0.72,
//           ),
//           itemCount: c.products.length,
//           itemBuilder: (_, i) {
//             final p = c.products[i];
//             return Card(
//               clipBehavior: Clip.antiAlias,
//               child: InkWell(
//                 onTap: () => Get.to(() => ProductDetail(productIndex: i)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Image.network(
//                         p.imageUrl,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(3.w),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             p.name,
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(fontWeight: FontWeight.w600),
//                           ),
//                           SizedBox(height: 0.5.h),
//                           Text(c.formatPrice(p.priceCents)),
//                           SizedBox(height: 0.5.h),
//                           Row(
//                             children: [
//                               Icon(
//                                 p.expressEligible
//                                     ? Icons.flash_on
//                                     : Icons.schedule,
//                                 size: 16,
//                               ),
//                               const SizedBox(width: 6),
//                               Text(
//                                 p.expressEligible
//                                     ? 'Eligible for Quick'
//                                     : 'Standard delivery',
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
