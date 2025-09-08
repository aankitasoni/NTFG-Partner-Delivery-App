import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/routes.dart';
import 'core/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GadgetsApp());
}

class GadgetsApp extends StatelessWidget {
  const GadgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gadgets Delivery',
        theme: AppTheme.light,
        initialRoute: Routes.home,
        getPages: Routes.pages,
      ),
    );
  }
}
