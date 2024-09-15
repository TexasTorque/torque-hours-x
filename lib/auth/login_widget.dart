import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:torque_hours_x/auth/firebase_auth.dart';

Widget getLoginWidget() {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _logIn() async {
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.login(email, password);
  }

  return Center(
    child: Container(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Login", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.only(left: 10),
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.only(left: 10, right: 50),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: Icon(Icons.visibility),
                suffixIconConstraints: BoxConstraints(
                  minWidth: 48,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              _logIn();
            },
            child: Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}