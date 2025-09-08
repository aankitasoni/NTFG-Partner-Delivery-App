import 'package:mobile/screens/admin/home_admin.dart';
import 'package:mobile/screens/bottom_navbar.dart';
import 'package:mobile/screens/login_signup/login_screen.dart';
import 'package:mobile/screens/onboarding/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    // --- IGNORE ---
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'UniShare Project',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: const BottomNavbar(),
          home: const LoginScreen(),
          // home: const OnboardingScreen(),
          // home: const HomeAdmin(),
        );
      },
    );
  }
}
