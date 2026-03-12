import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_erp/controlar/auth_provider.dart';
import 'package:school_erp/controlar/calendar_provider.dart';
import 'package:school_erp/controlar/parents_provider.dart';
import 'package:school_erp/routes/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CalendarProvider()),
        ChangeNotifierProvider(create: (c) => ParentsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.unboundedTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFF6F5F5),
      ),
      title: 'School ERP',
    );
  }
}
