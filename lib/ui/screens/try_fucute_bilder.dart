import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_erp/controlar/fuctre_api_call.dart';
import 'package:school_erp/controlar/parents_provider.dart';
import 'package:school_erp/model/parent_model.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';
import 'package:school_erp/ui/widgets/student_widget.dart';

class TryFucuterBilder extends StatefulWidget {
  const TryFucuterBilder({super.key});

  @override
  State<TryFucuterBilder> createState() => _TryFucuteBilderState();
}

class _TryFucuteBilderState extends State<TryFucuterBilder> {
  late Future<APIResponse> futureData;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<ParentsProvider>().parentDetails(context: context);
    // });
    futureData = getParentsDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWithBackWidget(titleText: "Parent Info"),

      body: FutureBuilder(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
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
                                          return CircleAvatar(
                                            radius: 50,
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                                  snapshot
                                                          .data
                                                          ?.student
                                                          ?.profilPic ??
                                                      "",
                                                ),
                                            backgroundColor: Color(0xffffffff),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Text(
                                        snapshot
                                                .data
                                                ?.student
                                                ?.studentName ??
                                            "",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.all(15),

                                    child: StudentInfmoWidget(
                                      firstText: "Scholar No",
                                      lastText:
                                          snapshot
                                              .data
                                              ?.student
                                              ?.scholarNo ??
                                          "",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                    ),
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
                                    child: StudentInfmoWidget(
                                      firstText: "Father's Name",
                                      lastText:
                                          snapshot
                                              .data
                                              ?.student
                                              ?.fatherName ??
                                          "",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                    ),
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
                                    child: StudentInfmoWidget(
                                      firstText: "Father professiom",
                                      lastText:
                                          snapshot
                                              .data
                                              ?.student
                                              ?.fatherProf ??
                                          "",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                    ),
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
                                    child: StudentInfmoWidget(
                                      firstText: "Father's Qualification",
                                      lastText:
                                          snapshot
                                              .data
                                              ?.student
                                              ?.fatherQuali ??
                                          "",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                    ),
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
                                    child: StudentInfmoWidget(
                                      firstText: "Father's Mobile",
                                      lastText:
                                          snapshot
                                              .data
                                              ?.student
                                              ?.fatherNo ??
                                          "",
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                    ),
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
                                    child: StudentInfmoWidget(
                                      firstText: "Mother'Name",
                                      lastText:
                                          snapshot
                                              .data
                                              ?.student
                                              ?.motherName ??
                                          "",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                    ),
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
                                    child: StudentInfmoWidget(
                                      firstText: "Mother's Profession",
                                      lastText:
                                          snapshot
                                              .data
                                              ?.student
                                              ?.motherProf ??
                                          "",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                    ),
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
                                    child: StudentInfmoWidget(
                                      firstText: "Mother's Qualification",
                                      lastText:
                                          snapshot
                                              .data
                                              ?.student
                                              ?.motherQuali ??
                                          "",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                    ),
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
                                    child: StudentInfmoWidget(
                                      firstText: "Mother's Mobile",
                                      lastText:
                                          snapshot.data?.student?.motherNo ??
                                          "",
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
            );

            ////
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
