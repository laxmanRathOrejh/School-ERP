import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_erp/controlar/studentprofile_provider.dart';
import 'package:school_erp/ui/widgets/appbar_widget.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';
import 'package:school_erp/ui/widgets/dialog/image_dialog.dart';
import 'package:school_erp/ui/widgets/student_widget.dart';
import 'package:dotted_line/dotted_line.dart';

class StudentProfilScreen extends StatefulWidget {
  final bool fromBottomNav;
  const StudentProfilScreen({super.key, required this.fromBottomNav});

  @override
  State<StudentProfilScreen> createState() => _StudentProfilScreenState();
}

class _StudentProfilScreenState extends State<StudentProfilScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StudentprofileProvider>().getStudentProfile(
        context: context,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var profileProvider = Provider.of<StudentprofileProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: widget.fromBottomNav
          ? AppbarWidget(
              titleText: "Profile",
              onMenuTap: () {
                Scaffold.of(context).openDrawer();
              },
            )
          : AppbarWithBackWidget(titleText: "Profile"),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffeeeeee),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Student List",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: 16),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffffffff),
                      ),
                      child: Consumer<StudentprofileProvider>(
                        builder: (context, value, child) {
                          var studentdetails =
                              profileProvider.studentModel?.studentProfile;

                          return Column(
                            children: [
                              SizedBox(height: 14),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child:
                                        studentdetails?.image?.isNotEmpty ??
                                            false
                                        ? InkWell(
                                            onTap: () {
                                              showImageDialog(
                                                context: context,
                                                imagePath:
                                                    studentdetails?.image ?? "",
                                                isAssetskImage: false,
                                              );
                                            },
                                            child: CircleAvatar(
                                              radius: 50,
                                              backgroundImage:
                                                  CachedNetworkImageProvider(
                                                    studentdetails?.image ?? "",
                                                  ),

                                              backgroundColor: Color(
                                                0xffffffff,
                                              ),
                                            ),
                                          )
                                        : SizedBox(height: 50),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Text(
                                    studentdetails?.name ?? "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: StudentInfmoWidget(
                                  firstText: "Scholor No",
                                  lastText: studentdetails?.scholarNo ?? "",
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
                                padding: const EdgeInsets.all(8.0),
                                child: StudentInfmoWidget(
                                  firstText: "Class",
                                  lastText: studentdetails?.stlass ?? "",
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
                                padding: const EdgeInsets.all(8.0),
                                child: StudentInfmoWidget(
                                  firstText: "House",
                                  lastText: studentdetails?.house ?? "",
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
                                padding: const EdgeInsets.all(8.0),
                                child: StudentInfmoWidget(
                                  firstText: "Attendence",
                                  lastText: studentdetails?.attendence ?? "",
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
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                  top: 8,
                                ),
                                child: StudentInfmoWidget(
                                  firstText: "Father's Name",
                                  lastText: studentdetails?.fatherName ?? "",
                                ),
                              ),
                              Divider(
                                indent: 8,
                                endIndent: 8,
                                thickness: 4,

                                color: Color(0xff4d97c7),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                  bottom: 8,
                                ),
                                child: StudentInfmoWidget(
                                  firstText: "Mother's Name",
                                  lastText: studentdetails?.motherName ?? "",
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
                                padding: const EdgeInsets.all(8.0),
                                child: StudentInfmoWidget(
                                  firstText: "Contact No",
                                  lastText: studentdetails?.contactNo ?? "",
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
                                padding: const EdgeInsets.all(8.0),
                                child: StudentInfmoWidget(
                                  firstText: "Sms No",
                                  lastText: studentdetails?.mobileNo ?? "",
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
                                padding: const EdgeInsets.all(8.0),
                                child: StudentInfmoWidget(
                                  firstText: "Email",
                                  lastText: studentdetails?.email ?? "",
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Address Info",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Consumer<StudentprofileProvider>(
                        builder: (context, value, child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            child: Text(
                              value.studentModel?.studentProfile?.address ?? "",
                              style: TextStyle(color: Color(0xffcecece)),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
