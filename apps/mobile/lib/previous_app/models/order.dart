// class Order {
//   final String id;
//   final Location pickup;
//   final Location dropoff;
//   final int items;

//   Order({
//     required this.id,
//     required this.pickup,
//     required this.dropoff,
//     required this.items,
//   });

//   factory Order.fromJson(Map<String, dynamic> json) {
//     return Order(
//       id: json['id'] as String,
//       pickup: Location.fromJson(json['pickup']),
//       dropoff: Location.fromJson(json['dropoff']),
//       items: json['items'] as int,
//     );
//   }
// }

// class Location {
//   final double lat;
//   final double lng;

//   Location({required this.lat, required this.lng});

//   factory Location.fromJson(Map<String, dynamic> json) {
//     return Location(
//       lat: (json['lat'] as num).toDouble(),
//       lng: (json['lng'] as num).toDouble(),
//     );
//   }
// }