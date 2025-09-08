import 'package:mobile/services/database.dart';
import 'package:mobile/services/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/widget_support.dart';

class DetailsScreen extends StatefulWidget {
  final String title, subtitle, content;
  final double price; 

  const DetailsScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.price,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String? id;
  int quantity = 1;

  getTheSharedPref() async {
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTheSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,
                      ),
                    ),
                    Image.asset(
                      "assets/headphone.jpg",
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.5,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),
                            Text(
                              widget.subtitle,
                              style: AppWidget.boldTextFieldStyle(),
                            ),
                          ],
                        ),
                        const Spacer(),
                        // 🔹 Quantity selector
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (quantity > 1) {
                                    setState(() => quantity--);
                                  }
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              Text(
                                quantity.toString(),
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() => quantity++);
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "₹${widget.price} each",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.green[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Total: ₹${widget.price * quantity}",
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.red[800],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      widget.content,
                      style: AppWidget.lightTextFieldStyle(),
                    ),
                    SizedBox(height: 3.h),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 🔹 Add to Cart
                  GestureDetector(
                    
                    onTap: () async {
                      if (id == null || id!.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please log in to add items to cart'),
                          ),
                        );
                        return;
                      }

                      Map<String, dynamic> cartItem = {
                        "Title": widget.title,
                        "Subtitle": widget.subtitle,
                        "Content": widget.content,
                        "Price": widget.price,
                        "Quantity": quantity,
                        "TotalPrice": widget.price * quantity,
                      };

                      try {
                        await DatabaseMethods().addToCart(cartItem, id!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Added to Cart")),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Failed to add to cart: $e")),
                        );
                      }
                    },

                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.8,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.shopping_cart, color: Colors.black),
                          SizedBox(width: 2.w),
                          const Text(
                            "Add to Cart",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 🔹 Share
                  GestureDetector(
                    onTap: () {
                      String shareText =
                          "${widget.title}\n\n${widget.subtitle}\n\n${widget.content}\n\nPrice: ₹${widget.price}";
                      Share.share(shareText);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.8,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.share_rounded, color: Colors.black),
                          SizedBox(width: 2.w),
                          const Text(
                            "Share",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
