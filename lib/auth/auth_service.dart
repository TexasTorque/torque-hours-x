import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:torque_hours_x/screens/home.dart';
import 'package:torque_hours_x/screens/login_screen.dart';

class AuthService {
  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    
    try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen()
        )
      );
      
    } on FirebaseAuthException catch(e) {
      ToastContext().init(context);
      Toast.show(e.code, duration: 5, gravity: 0, backgroundColor: Colors.white, textStyle: const TextStyle(color: Colors.black));
    }

  }

  Future<void> signout({
    required BuildContext context,
  }) async {
    
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen(),
      )
    );
  }
}