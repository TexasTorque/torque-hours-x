import 'package:flutter/material.dart';
import 'package:torque_hours_x/screens/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  final phoneKey = GlobalKey<FormState>();
  final otpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.black,
          title: Container(
            margin: const EdgeInsets.only(left: 80, right: 80),
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 5)
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/imgs/torque_logo.png'), width: 50),
                Text('TORQUE HOURS', style: TextStyle(fontFamily: 'Market Deco', color: Colors.white)),
              ],
            ),
          ),
        ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text('Login', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Form(
                  key: phoneKey,
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.only(left: 10, top: 3),
                      hintText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone),
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 48,
                      ),
                    ),
                    validator: (value) {
                      if (value!.length != 10) {
                        return 'Invalid phone number';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  if (phoneKey.currentState!.validate()) {
                    AuthService.sendOTP(
                      phoneNumber: phoneController.text,
                      onError: () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error sending OTP', style: TextStyle(color: Colors.white),), backgroundColor: Colors.red));
                      },
                      onSent: () {
                        showDialog(context: context, builder: (context) => AlertDialog(
                          title: const Text('OTP Verification'), content: Column(
                          children: [
                            const Text('Enter 6 digit OTP'),
                            const SizedBox(height: 12),
                            Form(
                              key: otpKey,
                              child: TextFormField(
                                controller: otpController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                                  contentPadding: EdgeInsets.only(left: 10, top: 3),
                                  hintText: 'OTP',
                                  prefixIcon: Icon(Icons.phone),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIconConstraints: BoxConstraints(
                                    minWidth: 48,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.length != 6) {
                                    return 'Invalid OTP code';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        )));
                      },
                    );
                  }
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
                      'Send OTP',
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
      ),
    );
  }
}