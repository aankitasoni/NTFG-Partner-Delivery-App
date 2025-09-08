// import 'package:get/get.dart';
// import '../../data/api.dart';
// import '../../data/models.dart';

// class QuickController extends GetxController {
//   final ApiClient api;
//   QuickController(this.api);

//   final loading = false.obs;
//   final feed = <OrderFeedItem>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchFeed();
//   }

//   Future<void> fetchFeed() async {
//     loading.value = true;
//     try {
//       feed.assignAll(await api.getOrderFeed());
//     } finally {
//       loading.value = false;
//     }
//   }
// }
