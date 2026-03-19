import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_erp/controlar/Curriculum_provider.dart';
import 'package:school_erp/controlar/auth_provider.dart';
import 'package:school_erp/controlar/calendar_provider.dart';
import 'package:school_erp/controlar/chat_provider.dart';
import 'package:school_erp/controlar/fess_provider.dart';
import 'package:school_erp/controlar/local_list_update.dart';
import 'package:school_erp/controlar/parents_provider.dart';
import 'package:school_erp/controlar/studentprofile_provider.dart';
import 'package:school_erp/controlar/teacher_list_provider.dart';
import 'package:school_erp/routes/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CalendarProvider()),
        ChangeNotifierProvider(create: (_) => ParentsProvider()),
        ChangeNotifierProvider(create: (_) => TeacherListProvider()),
        ChangeNotifierProvider(create: (_) => ChatDataProvider()),
        ChangeNotifierProvider(create: (_) => LocalListUpdate()),
        ChangeNotifierProvider(create: (_) => FessProvider()),
        ChangeNotifierProvider(create: (_) => StudentprofileProvider()),
        ChangeNotifierProvider(create: (_)=>CurriculumProvider())
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
