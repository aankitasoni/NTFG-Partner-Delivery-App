import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile/services/database.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/widget_support.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool headphone = false,
      television = false,
      kitchenAppliances = false,
      livingAppliances = false;

  Stream? contentTypeStream;

  ontheload() async {
    contentTypeStream = await DatabaseMethods().getGadgetsItem("HeadPhone");
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    ontheload();
    super.initState();
  }

  Widget allItems() {
    return StreamBuilder(
      stream: contentTypeStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            title: ds["product_name"],
                            subtitle: ds["product_brand"],
                            content: ds["product_specification"],
                            price: ds["price"] ?? 0.0,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/headphone.jpg",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 1.h),

                              Text(
                                ds["product_name"],
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                              SizedBox(height: 0.1.h),
                              Text(
                                ds["product_brand"],
                                style: AppWidget.lightTextFieldStyle(),
                              ),
                              SizedBox(height: 5.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.thumb_up,
                                      color: isLiked1
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isLiked1 = !isLiked1;
                                        isDisliked1 = false;
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.thumb_down,
                                      color: isDisliked1
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isDisliked1 = !isDisliked1;
                                        isLiked1 = false;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : CircularProgressIndicator();
      },
    );
  }

  Widget allItemsVertically() {
    return StreamBuilder(
      stream: contentTypeStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            title: ds["product_name"],
                            subtitle: ds["product_brand"],
                            content: ds["product_specification"],
                            price: ds["price"] ?? 0.0,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      // todo
                      margin: EdgeInsets.only(right: 20.0, bottom: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/gadgets.jpg",
                                height: 120,
                                width: 110,
                                fit: BoxFit.cover,
                              ),
                              // Image.network(
                              //   ds["image"], // Firestore field containing the image URL
                              //   height: 120,
                              //   width: 110,
                              //   fit: BoxFit.cover,
                              // ),
                              SizedBox(width: 20.0),
                              Column(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      ds["product_name"],
                                      style: AppWidget.semiBoldTextFieldStyle(),
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      ds["product_brand"],
                                      style: AppWidget.lightTextFieldStyle(),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      ds["price"] != null
                                          ? "₹ ${ds["price"]}"
                                          : "Free",
                                      maxLines: 1,
                                      style: AppWidget.lightTextFieldStyle(),
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      ds["product_specification"],
                                      maxLines: 3,
                                      style: AppWidget.productExplain(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : CircularProgressIndicator();
      },
    );
  }

  bool isLiked1 = false;
  bool isLiked2 = false;
  bool isDisliked1 = false;
  bool isDisliked2 = false;
  int likeCount = 0;

  bool get isCartActive => false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 2.h, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left side texts
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello Rajesh',
                            style: AppWidget.boldTextFieldStyle(),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            "NexFuga",
                            style: AppWidget.headlineTextFieldStyle(),
                          ),
                          Text(
                            "A place to explore, collaborate & buy",
                            style: AppWidget.lightTextFieldStyle(),
                          ),
                          SizedBox(height: 20.0),
                        ],
                      ),

                      // Right side cart box
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isCartActive
                              ? Color(0xFFff5c10)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  child: showItem(),
                ),
                SizedBox(height: 25.0),

                SizedBox(height: 37.6.h, child: allItems()),

                SizedBox(height: 30.0),

                SingleChildScrollView(child: allItemsVertically()),
                SizedBox(height: 30.0),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            headphone = true;
            television = false;
            kitchenAppliances = false;
            livingAppliances = false;
            contentTypeStream = await DatabaseMethods().getGadgetsItem(
              "HeadPhone",
            );
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: headphone ? Color(0xFFff5c10) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "assets/headphone.jpg",
                height: 7.h,
                width: 15.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            headphone = false;
            television = true;
            kitchenAppliances = false;
            livingAppliances = false;

            contentTypeStream = await DatabaseMethods().getGadgetsItem("TV");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: television ? Color(0xFFff5c10) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "assets/tv.jpg",
                height: 7.h,
                width: 15.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            headphone = false;
            television = false;
            kitchenAppliances = true;
            livingAppliances = false;

            contentTypeStream = await DatabaseMethods().getGadgetsItem(
              "Kitchen Appliances",
            );
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: kitchenAppliances ? Color(0xFFff5c10) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "assets/kitchenAppliances.jpg",
                height: 7.h,
                width: 15.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            headphone = false;
            television = false;
            kitchenAppliances = false;
            livingAppliances = true;

            contentTypeStream = await DatabaseMethods().getGadgetsItem(
              "Living Appliances",
            );
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: livingAppliances ? Color(0xFFff5c10) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "assets/livingAppliances.jpg",
                height: 7.h,
                width: 15.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
