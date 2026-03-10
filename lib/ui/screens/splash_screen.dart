import 'dart:async';
import 'package:flutter/material.dart';
import 'package:school_erp/ui/screens/dashboard_screen.dart';
import 'package:school_erp/ui/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    chekToken();
    // Timer(const Duration(seconds: 2), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => LoginScrenn()),
    //   );
    // });
  }

  void chekToken() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("Token");
    debugPrint("this is token from memory$token");
    Timer(const Duration(seconds: 2), () {
      if ( token != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      }
    else{
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScrenn()),
        );

    }}
    
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset("assets/image/splashScreen.jpeg", fit: BoxFit.cover),
      ),
    );
  }
}
