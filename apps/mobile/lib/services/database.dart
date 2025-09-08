import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  }

  Future addContent(Map<String, dynamic> contentMap, String category) async {
    // 1️⃣ Add to flat collection for easy Firebase console view
    await FirebaseFirestore.instance.collection('gadgets').add({
      ...contentMap,
      "category": category,
    });

    // 2️⃣ Add to nested collection for organized structure
    await FirebaseFirestore.instance
        .collection("products")
        .doc(category)
        .collection("items")
        .add(contentMap);
  }

  Future<Stream<QuerySnapshot>> getGadgetsItem(String category) async {
    return FirebaseFirestore.instance
        .collection("products")
        .doc(category)
        .collection("items")
        .snapshots();
  }

  Future<void> addToCart(Map<String, dynamic> cartItem, String userId) async {
    // TODO: Implement the logic to add cartItem to the user's cart in your database.
    // Example for Firestore:
    // await FirebaseFirestore.instance
    //   .collection('users')
    //   .doc(userId)
    //   .collection('cart')
    //   .add(cartItem);
  }

  Future addSavedContent(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection("Saved")
        .add(userInfoMap);
  }

  Future<void> addGadgetItem(Map<String, dynamic> itemData) async {
    await FirebaseFirestore.instance.collection('gadgets').add(itemData);
  }
}
