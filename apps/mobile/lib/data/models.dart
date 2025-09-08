// class OrderFeedItem {
//   OrderFeedItem({
//     required this.id,
//     required this.pickupLat,
//     required this.pickupLng,
//     required this.dropLat,
//     required this.dropLng,
//     required this.items,
//   });

//   factory OrderFeedItem.fromJson(Map<String, dynamic> j) => OrderFeedItem(
//     id: j['id'],
//     pickupLat: (j['pickup']['lat'] as num).toDouble(),
//     pickupLng: (j['pickup']['lng'] as num).toDouble(),
//     dropLat: (j['dropoff']['lat'] as num).toDouble(),
//     dropLng: (j['dropoff']['lng'] as num).toDouble(),
//     items: j['items'] as int,
//   );
// }

// class Product {
//   final String id;
//   final String name;
//   final int priceCents;
//   final String imageUrl;
//   final bool expressEligible;

//   Product({
//     required this.id,
//     required this.name,
//     required this.priceCents,
//     required this.imageUrl,
//     required this.expressEligible,
//   });
// }
