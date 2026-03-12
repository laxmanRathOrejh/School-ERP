
import 'package:flutter/material.dart';
import 'package:school_erp/ui/screens/curriculum_screen.dart';
import 'package:school_erp/ui/screens/dashboard_screen.dart';
import 'package:school_erp/ui/screens/fess_screen.dart';
import 'package:school_erp/ui/screens/profil_screen.dart';
import 'package:school_erp/ui/screens/pt_chat_screen.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _Dashbard1State();
}

class _Dashbard1State extends State<HomeScreen> {
  List<Widget> allPage = [
    DashboardScreen(),
    CurriculumScreen(fromBottomNav: true),
    FessScreen(fromBottomNav: true),
    PtChatsScreen(fromBottomNav: true),
    StudentProfilScreen(fromBottomNav: true),
  ];

  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xffffffff),
      body: IndexedStack(index: currentindex, children: allPage),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Color(0xffffffff),
            border: Border.all(color: Color(0xffE8E8E8)),
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: .1)],
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(35),
            child: BottomNavigationBar(
              backgroundColor: Color(0xffFFFFFF),

              currentIndex: currentindex,
              onTap: (value) {
                setState(() {
                  currentindex = value;
                });
              },
              elevation: 0,
              selectedItemColor: Color(0xFF158DF0),
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              unselectedItemColor: Color(0xffd2d2d2),

              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper),
                  label: "Curriculum",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.blinds_closed),
                  label: "Fess",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_rounded),
                  label: "PT Chats",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_rounded),
                  label: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
