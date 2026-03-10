import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_erp/controlar/Auth_provider.dart';
import 'package:school_erp/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.unboundedTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFF6F5F5),
      ),
      title: 'School ERP',
      home: SplashScreen(),
    );
  }
}
