import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_erp/controlar/parents_provider.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';
import 'package:school_erp/ui/widgets/student_widget.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ParentsProvider>().parentDetails(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var parentsData = Provider.of<ParentsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppbarWithBackWidget(titleText: "Parent Info"),

      body: Container(
        color: Color(0xffeeeeee),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffffffff),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 14),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Consumer<ParentsProvider>(
                                  builder: (context, value, child) {
                                    return parentsData
                                                .parentsDetails
                                                ?.profilPic
                                                ?.isNotEmpty ??
                                            false
                                        ? CircleAvatar(
                                            radius: 50,
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                                  parentsData
                                                          .parentsDetails
                                                          ?.profilPic ??
                                                      "",
                                                ),
                                            backgroundColor: Color(0xffffffff),
                                          )
                                        : SizedBox(height: 100);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Consumer<ParentsProvider>(
                                  builder: (context, value, child) {
                                    return Text(
                                      parentsData.parentsDetails?.studentName ??
                                          "",
                                      style: TextStyle(fontSize: 18),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.all(15),

                              child: Consumer<ParentsProvider>(
                                builder: (context, value, child) {
                                  return StudentInfmoWidget(
                                    firstText: "Scholar No",
                                    lastText:
                                        parentsData.parentsDetails?.scholarNo ??
                                        "",
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: DottedLine(
                                direction: Axis.horizontal,
                                lineLength: double.infinity,
                                lineThickness: 2.0,
                                dashColor: Color(0xffececec),
                                dashRadius: 0.0,
                                dashGapLength: 2.0,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Consumer<ParentsProvider>(
                                builder: (context, value, child) {
                                  return StudentInfmoWidget(
                                    firstText: "Father's Name",
                                    lastText:
                                        parentsData
                                            .parentsDetails
                                            ?.fatherName ??
                                        "",
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: DottedLine(
                                direction: Axis.horizontal,
                                lineLength: double.infinity,
                                lineThickness: 2.0,
                                dashColor: Color(0xffececec),
                                dashRadius: 0.0,
                                dashGapLength: 2.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Consumer<ParentsProvider>(
                                builder: (context, value, child) {
                                  return StudentInfmoWidget(
                                    firstText: "Father professiom",
                                    lastText:
                                        parentsData
                                            .parentsDetails
                                            ?.fatherProf ??
                                        "",
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: DottedLine(
                                direction: Axis.horizontal,
                                lineLength: double.infinity,
                                lineThickness: 2.0,
                                dashColor: Color(0xffececec),
                                dashRadius: 0.0,
                                dashGapLength: 2.0,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Consumer<ParentsProvider>(
                                builder: (context, value, child) {
                                  return StudentInfmoWidget(
                                    firstText: "Father's Qualification",
                                    lastText:
                                        parentsData
                                            .parentsDetails
                                            ?.fatherQuali ??
                                        "",
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: DottedLine(
                                direction: Axis.horizontal,
                                lineLength: double.infinity,
                                lineThickness: 2.0,
                                dashColor: Color(0xffececec),
                                dashRadius: 0.0,
                                dashGapLength: 2.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Consumer<ParentsProvider>(
                                builder: (context, value, child) {
                                  return StudentInfmoWidget(
                                    firstText: "Father's Mobile",
                                    lastText:
                                        parentsData.parentsDetails?.fatherNo ??
                                        "",
                                  );
                                },
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: DottedLine(
                                direction: Axis.horizontal,
                                lineLength: double.infinity,
                                lineThickness: 2.0,
                                dashColor: Color(0xffececec),
                                dashRadius: 0.0,
                                dashGapLength: 2.0,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Consumer<ParentsProvider>(
                                builder: (context, value, child) {
                                  return StudentInfmoWidget(
                                    firstText: "Mother'Name",
                                    lastText:
                                        parentsData
                                            .parentsDetails
                                            ?.motherName ??
                                        "",
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: DottedLine(
                                direction: Axis.horizontal,
                                lineLength: double.infinity,
                                lineThickness: 2.0,
                                dashColor: Color(0xffececec),
                                dashRadius: 0.0,
                                dashGapLength: 2.0,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Consumer<ParentsProvider>(
                                builder: (context, value, child) {
                                  return StudentInfmoWidget(
                                    firstText: "Mother's Profession",
                                    lastText:
                                        parentsData
                                            .parentsDetails
                                            ?.motherProf ??
                                        "",
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: DottedLine(
                                direction: Axis.horizontal,
                                lineLength: double.infinity,
                                lineThickness: 2.0,
                                dashColor: Color(0xffececec),
                                dashRadius: 0.0,
                                dashGapLength: 2.0,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Consumer<ParentsProvider>(
                                builder: (context, value, child) {
                                  return StudentInfmoWidget(
                                    firstText: "Mother's Qualification",
                                    lastText:
                                        parentsData
                                            .parentsDetails
                                            ?.motherQuali ??
                                        "",
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: DottedLine(
                                direction: Axis.horizontal,
                                lineLength: double.infinity,
                                lineThickness: 2.0,
                                dashColor: Color(0xffececec),
                                dashRadius: 0.0,
                                dashGapLength: 2.0,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Consumer<ParentsProvider>(
                                builder: (context, value, child) {
                                  return StudentInfmoWidget(
                                    firstText: "Mother's Mobile",
                                    lastText:
                                        value.parentsDetails?.motherNo ?? "",
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      // const SizedBox(height: 10),
                      // Text(
                      //   "Address Info",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 15,
                      //   ),
                      // ),
                      // const SizedBox(height: 10),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: Color(0xffffffff),
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //       horizontal: 12,
                      //       vertical: 12,
                      //     ),
                      //     child: Row(
                      //       children: [
                      //         Text(
                      //           "95442 Civil Line Jaipur",
                      //           style: TextStyle(color: Color(0xffcecece)),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 100),
                    ],
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
