// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class DeliveryOptionTile extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final IconData icon;
//   final Gradient gradient;
//   final VoidCallback onTap;

//   const DeliveryOptionTile({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.icon,
//     required this.gradient,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(18),
//       onTap: onTap,
//       child: Ink(
//         height: 24.h,
//         decoration: BoxDecoration(
//           gradient: gradient,
//           borderRadius: BorderRadius.circular(18),
//           boxShadow: const [
//             BoxShadow(
//               blurRadius: 10,
//               offset: Offset(0, 6),
//               color: Color(0x1A000000),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(4.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Icon(icon, size: 28.sp, color: Colors.white),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 19.sp,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 0.8.h),
//                   Text(
//                     subtitle,
//                     style: TextStyle(
//                       fontSize: 15.sp,
//                       color: Colors.white.withOpacity(0.95),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
