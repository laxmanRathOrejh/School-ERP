
import 'package:flutter/material.dart';
import 'package:school_erp/ui/widgets/appbar_widget.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';
import 'package:school_erp/ui/widgets/next_button.dart';

class FessScreen extends StatefulWidget {
  final bool fromBottomNav;

  const FessScreen({super.key, required this.fromBottomNav});

  @override
  State<FessScreen> createState() => _FessScreenState();
}

class _FessScreenState extends State<FessScreen> {
  String? selectedClass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.fromBottomNav
          ? AppbarWidget(titleText: "Fess")
          : AppbarWithBackWidget(titleText: "Fess"),
      body: Container(
        color: Color(0xfff0f0f0),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 50),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 120,
                      child: Image.asset("assets/image/fesshistry.png"),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Text(
                    "Select session",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownButtonFormField<String>(
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.keyboard_arrow_down_rounded, size: 28),
                    ),

                    initialValue: selectedClass,
                    isExpanded: true,

                    focusColor: Color(0xffdeeef8),

                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffffffff),

                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      hintText: "Session Select",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFF7288D8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFF7288D8)),
                      ),
                    ),
                    items:
                        [
                              "Session 2024-25",
                              "Session 2023-24",
                              "Session 2022-23",
                            ]
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedClass = value;
                      });
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: NextButton(onTap: () {}, text: "Continue"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
