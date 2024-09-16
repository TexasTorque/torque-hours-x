import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static String verificationId = '';

  static Future<void> sendOTP({
    required String phoneNumber,
    required Function onError,
    required Function onSent,
  }) async {
    await firebaseAuth.verifyPhoneNumber(
      timeout: const Duration(seconds: 30),
      phoneNumber: '+1$phoneNumber',
      verificationCompleted: (phoneAuthCredential) async {},
      verificationFailed: (error) async {},
      codeSent: (verifyId, forceResendingToken) async {
        verificationId = verifyId;
        onSent();
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    ).onError((error, stacktrace) {print(stacktrace);});
  }

  static Future<bool> loginOTP({required String otp}) async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );

    final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
    final User? user = userCredential.user;

    if (user != null) {
      return true;
    }
    return false;
  }

  static Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  static Future<bool> isLoggedIn() async {
    return firebaseAuth.currentUser != null;
  } 
}