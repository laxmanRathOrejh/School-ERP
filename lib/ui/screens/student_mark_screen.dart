import 'package:flutter/material.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';
import 'package:school_erp/ui/widgets/dialog/keep_alive_wigdet.dart';
import 'package:school_erp/ui/widgets/next_button.dart';

class StudentMarkScreen extends StatefulWidget {
  const StudentMarkScreen({super.key});

  @override
  State<StudentMarkScreen> createState() => _StudentMarkScreenState();
}

class _StudentMarkScreenState extends State<StudentMarkScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late List<TextEditingController> controllers;
  String message = "";
  bool isError = false;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
      studentDetails.length,
      (_) => TextEditingController(),
    );

    // controllers = List.generate(10, (_) => TextEditingController());
  }

  List<Map<String, dynamic>> studentDetails = [
    {"lable": "Name", "message": "Fill the Name ", "stData": null},
    {"lable": "FName", "message": "Fill the FName ", "stData": null},
    {"lable": "Address", "message": "Fill the address ", "stData": null},
    {"lable": "Class", "message": "Fill the class ", "stData": null},
    {"lable": "MoNumber", "message": "Fill the mobileNumber ", "stData": null},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWithBackWidget(titleText: "Select Role"),
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 20),

              Expanded(
                child: Container(
                  height: 40,
                  color: Color(0xFFd07062),
                  child: Center(
                    child: Text(
                      "Absent",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 40),
              Expanded(
                child: Container(
                  height: 40,
                  color: Color(0xFF357ad5),
                  child: Center(
                    child: Text(
                      "Medical Leave",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 20),

              Expanded(
                child: Container(
                  height: 40,
                  color: Color(0xFF429aa4),
                  child: Center(
                    child: Text(
                      "Medical Leave",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 40),
              Expanded(
                child: Container(
                  height: 40,
                  color: Color(0xFF5468c7),
                  child: Center(
                    child: Text(
                      "Medical Leave",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 10),
          Container(
            color: const Color(0xFFD5D4D4),
            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        "Max Marks",
                        style: TextStyle(fontWeight: FontWeight.w100),
                      ),
                    ),
                    Text("20", style: TextStyle(fontWeight: FontWeight.w100)),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        "Subject Type",
                        style: TextStyle(fontWeight: FontWeight.w100),
                      ),
                    ),
                    Text(
                      "Scholastic",
                      style: TextStyle(fontWeight: FontWeight.w100),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),

          // Expanded(
          //   child: Form(
          //     key: _formKey,
          //     child: SingleChildScrollView(
          //       child: Column(
          //         children: [
          //           ...controllers.map((e) {
          //             int index = controllers.indexOf(e);
          //             return Padding(
          //               padding: const EdgeInsets.all(10.0),
          //               child: Row(
          //                 children: [
          //                   SizedBox(width: 10),
          //                   Expanded(flex: 3, child: Text("Advat raj sharma")),
          //                   Expanded(
          //                     flex: 1,
          //                     child: TextFormField(
          //                       controller: controllers[index],
          //                       keyboardType: TextInputType.numberWithOptions(),
          //                       autovalidateMode:
          //                           AutovalidateMode.onUserInteraction,
          //                       decoration: InputDecoration(
          //                         //errorMaxLines: 2,
          //                         alignLabelWithHint: true,

          //                         errorStyle: TextStyle(fontSize: 10),
          //                         errorBorder: OutlineInputBorder(
          //                           borderRadius: BorderRadius.circular(14),
          //                         ),
          //                         border: OutlineInputBorder(
          //                           borderRadius: BorderRadius.circular(14),
          //                         ),
          //                       ),
          //                       validator: (value) {
          //                         if (value == null || value.isEmpty) {
          //                           return "Enter Marks";
          //                         } else {
          //                           return null;
          //                         }
          //                       },
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             );
          //           }),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              // cacheExtent: 10000,
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhy,
              // padding: EdgeInsets.only(bottom: 50),
              itemCount: studentDetails.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controllers[index],
                        decoration: InputDecoration(
                          hint: Text(studentDetails[index]["lable"]),
                          border: OutlineInputBorder(),
                          // error: Text(message),
                          // errorText: ,
                          errorText:
                              (isError &&
                                  studentDetails[index]["message"] != null)
                              ? studentDetails[index]["message"]
                              : null,
                          // if(isError){
                          // error: Text(
                          //   controllers[index].text.isEmpty
                          //       ? studentDetails[index]["message"]
                          //   : "",
                          // ),}
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),

                          // error: controllers[index].text.isEmpty
                          //     ? Text("${studentDetails[index]["message"]}")
                          //     : Text(""),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text(
                    //     controllers[index].text.isEmpty
                    //         ? studentDetails[index]["message"]
                    //         : "",
                    //   ),
                    // ),
                  ],
                );

                // return KeepAliveWrapper(
                //   child: Padding(
                //     padding: const EdgeInsets.all(10.0),
                //     child: Row(
                //       children: [
                //         SizedBox(width: 10),
                //         Expanded(flex: 3, child: Text("Advat raj sharma")),
                //         Expanded(
                //           flex: 1,
                //           child: TextFormField(
                //             key: ValueKey(index),
                //             controller: controllers[index],
                //             keyboardType: TextInputType.numberWithOptions(),
                //             autovalidateMode:
                //                 AutovalidateMode.onUserInteraction,
                //             decoration: InputDecoration(
                //               errorBorder: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(14),
                //               ),
                //               border: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(14),
                //               ),
                //             ),
                //             // validator: (value) {
                //             //   if (value == null || value.isEmpty) {
                //             //     return "Enter Marks";
                //             //   } else {
                //             //     return null;
                //             //   }
                //             // },
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // );

                //
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: NextButton(
              onTap: () {
                for (var itam in studentDetails) {
                  int index = studentDetails.indexOf(itam);

                  // setState(() {
                  if (controllers[index].text.isNotEmpty) {
                    itam["stData"] = controllers[index].text;
                    itam["message"] = null;
                  } else if (controllers[index].text.isEmpty) {
                    message = itam["message"][index];
                    isError = true;
                  }
                  setState(() {});
                  // });
                  // int index = studentDetails.indexOf(itam);
                  // setState(() {
                  //   itam["stData"] = controllers[index].text;
                  //   if (itam["stData"] == null) {}
                  // });
                  // debugPrint("Here is controllar data ${itam["stData"]}");
                }
                // if (_formKey.currentState!.validate()) {
                //   debugPrint("all form are good");
                // } else {
                //   debugPrint("no goog");
                // }
              },
              text: "Subit Marks",
            ),
          ),
        ],
      ),
    );
  }
}
