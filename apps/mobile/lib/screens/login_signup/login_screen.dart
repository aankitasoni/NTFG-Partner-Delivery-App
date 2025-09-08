import 'package:mobile/screens/bottom_navbar.dart';
import 'package:mobile/screens/login_signup/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widgets/widget_support.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "", password = "";

  final formKey = GlobalKey<FormState>();

  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavbar()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFff5c30), Color(0xFFe74b1a)],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3,
                  ),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Text(""),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2.h, left: 5.w, right: 5.w),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/logo-NxtFuga.jpeg",
                          width: MediaQuery.of(context).size.width / 3.5,
                          height: 10.h,
                          
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.only(left: 7.w, right: 7.w),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                SizedBox(height: 3.5.h),
                                Text(
                                  "Login",
                                  style: AppWidget.headlineTextFieldStyle(),
                                ),
                                SizedBox(height: 3.h),
                                TextFormField(
                                  controller: userEmailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Email';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle:
                                        AppWidget.semiBoldTextFieldStyle(),
                                    prefixIcon: Icon(Icons.email_outlined),
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                TextFormField(
                                  controller: userPasswordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Password';
                                    }
                                    return null;
                                  },
                                  obscureText: !_isPasswordVisible,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle:
                                        AppWidget.semiBoldTextFieldStyle(),
                                    prefixIcon: Icon(Icons.password_outlined),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                        setState(() {});
                                      },
                                      child: Icon(
                                        _isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ForgotPassword(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "Forgot Password?",
                                      style: AppWidget.semiBoldTextFieldStyle(),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                GestureDetector(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      setState(() {
                                        email = userEmailController.text;
                                        password = userPasswordController.text;
                                      });
                                    }
                                    userLogin();

                                    // TODO
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => BottomNavbar(),
                                    //   ),
                                    // );
                                  },
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                        color: Color(0Xffff5722),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "LOGIN",
                                          style: AppWidget.buttonText(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 7.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: AppWidget.semiBoldTextFieldStyle(),
                            children: [
                              TextSpan(
                                text: "Sign up",
                                style: AppWidget.boldTextFieldStyle().copyWith(
                                  color: Colors.blue,
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
        ),
      ),
    );
  }
}
