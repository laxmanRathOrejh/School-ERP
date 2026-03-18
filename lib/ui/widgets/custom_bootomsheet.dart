import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:school_erp/ui/widgets/student_widget.dart';

class FeesBreakupBottomSheet extends StatelessWidget {
  final dynamic provider;
  final int index;

  const FeesBreakupBottomSheet({
    super.key,
    required this.provider,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final data = provider.fessHistModel?.fessData?[index];

    return SingleChildScrollView(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Fees Breakup",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Text(
                  data?.quarter ?? "",

                  style: TextStyle(fontSize: 16, color: Color(0xff4d97c7)),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: StudentInfmoWidget(
                    firstText: "Student Name",
                    lastText: data.studentName ?? "",
                  ),
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 2.0,
                  dashColor: Color(0xFFCFCECE),
                  dashRadius: 0.0,
                  dashGapLength: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: StudentInfmoWidget(
                    firstText: "Class Name",
                    lastText: data.stclass ?? "",
                  ),
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 2.0,
                  dashColor: Color(0xFFCFCECE),
                  dashRadius: 0.0,
                  dashGapLength: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: StudentInfmoWidget(
                    firstText: "Reg No",
                    lastText: data.regNo ?? "",
                  ),
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 2.0,
                  dashColor: Color(0xFFCFCECE),
                  dashRadius: 0.0,
                  dashGapLength: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: StudentInfmoWidget(
                    firstText: "Recept No",
                    lastText: data.reciptNo ?? "",
                  ),
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 2.0,
                  dashColor: Color(0xFFCFCECE),
                  dashRadius: 0.0,
                  dashGapLength: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: StudentInfmoWidget(
                    firstText: "Receipt Date",
                    lastText: data.paymentDate ?? "",
                  ),
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 2.0,
                  dashColor: Color(0xFFCFCECE),
                  dashRadius: 0.0,
                  dashGapLength: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: StudentInfmoWidget(
                    firstText: "Mode Of Payment",
                    lastText: data.paymentMode ?? "",
                  ),
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 2.0,
                  dashColor: Color(0xFFCFCECE),
                  dashRadius: 0.0,
                  dashGapLength: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: StudentInfmoWidget(
                    firstText: "Amount",
                    lastText: " Rs ${data.amount}",
                  ),
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 2.0,
                  dashColor: Color(0xFFCFCECE),
                  dashRadius: 0.0,
                  dashGapLength: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: StudentInfmoWidget(
                    firstText: "Late Fess",
                    lastText: " Rs ${data.lateFess}",
                  ),
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 2.0,
                  dashColor: Color(0xFFCFCECE),
                  dashRadius: 0.0,
                  dashGapLength: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: StudentInfmoWidget(
                    firstText: "Total Fees",
                    lastText: "Rs ${data.total}",
                  ),
                ),

                SizedBox(height: 50),
              ],
            ),
          ),
          Positioned(
            //top: 20,
            bottom: 2,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF337ce2),
                  foregroundColor: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.download),
                    SizedBox(width: 10),
                    Text("Download Receipt"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
    
    
    
    ///SingleChildScrollView(
//       child: Stack(
//         children: [

//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

//                 const SizedBox(height: 20),

//                 const Center(
//                   child: Text(
//                     "Fees Breakup",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 Text(
//                   data?.quarter ?? "",
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: Color(0xff4d97c7),
//                   ),
//                 ),

//                 const SizedBox(height: 10),

//                 Text("Student Name : ${data?.studentName ?? ""}"),
//                 Text("Class Name : ${data?.stclass ?? ""}"),
//                 Text("Reg No : ${data?.regNo ?? ""}"),
//                 Text("Receipt No : ${data?.reciptNo ?? ""}"),
//                 Text("Receipt Date : ${data?.paymentDate ?? ""}"),
//                 Text("Mode Of Payment : ${data?.paymentMode ?? ""}"),
//                 Text("Amount : Rs ${data?.amount ?? ""}"),
//                 Text("Late Fees : Rs ${data?.lateFess ?? ""}"),
//                 Text("Total Fees : Rs ${data?.total ?? ""}"),

//                 const SizedBox(height: 100),
//               ],
//             ),
//           ),

//           Positioned(
//             bottom: 10,
//             left: 16,
//             right: 16,
//             child: ElevatedButton(
//               onPressed: () {},
//               child: const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.download),
//                   SizedBox(width: 8),
//                   Text("Download Receipt"),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }