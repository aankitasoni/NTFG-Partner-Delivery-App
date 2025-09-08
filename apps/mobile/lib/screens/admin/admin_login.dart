import 'package:mobile/screens/admin/home_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  bool _isPasswordVisible = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFededeb),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.4,
                  ),
                  padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFff5c30), Color(0xFFe74b1a)],
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(
                        MediaQuery.of(context).size.width,
                        110.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 80.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          "Let's start with\nAdmin!",
                          style: TextStyle(
                            color: Color(0xFFff5c90),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 50.0),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 20.0,
                                    top: 5.0,
                                    bottom: 5.0,
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 160, 160, 147),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: usernameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Username';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            160,
                                            160,
                                            147,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40.0),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 20.0,
                                    top: 5.0,
                                    bottom: 5.0,
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 160, 160, 147),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: userPasswordController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Password';
                                        }
                                        return null;
                                      },
                                      obscureText: !_isPasswordVisible,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            160,
                                            160,
                                            147,
                                          ),
                                        ),
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
                                  ),
                                ),
                                SizedBox(height: 40.0),
                                GestureDetector(
                                  onTap: () {
                                    LoginAdmin();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12.0,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFff5c90),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  LoginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['id'] != usernameController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Your id is not correct",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        } else if (result.data()['password'] !=
            userPasswordController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Your password is not correct",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        } else {
          Route route = MaterialPageRoute(builder: (context) => HomeAdmin());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }
}
