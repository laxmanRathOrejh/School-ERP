import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_erp/controlar/Curriculum_provider.dart';
import 'package:school_erp/ui/widgets/appbar_widget.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';
import 'package:school_erp/ui/widgets/notice_widget.dart';

class CurriculumScreen extends StatefulWidget {
  final bool fromBottomNav;

  const CurriculumScreen({super.key, required this.fromBottomNav});

  @override
  State<CurriculumScreen> createState() => _CurriculumScreenState();
}

class _CurriculumScreenState extends State<CurriculumScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CurriculumProvider>().getCurriculum(context: context);
    });
  }

  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    var curriculumProvider = Provider.of<CurriculumProvider>(
      context,
      listen: true,
    );
    return Scaffold(
      appBar: widget.fromBottomNav
          ? AppbarWidget(
              titleText: "Curriculum",
              onMenuTap: () {
                Scaffold.of(context).openDrawer();
              },
            )
          : AppbarWithBackWidget(titleText: "Curriculum"),

      body: Container(
        color: Color(0xfff0f0f0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Curriculum",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            shape: BeveledRectangleBorder(),
                            backgroundColor: isSelected
                                ? Color(0xff528fe6)
                                : Color(0xffffffff),
                            foregroundColor: isSelected
                                ? Color(0xffffffff)
                                : Color(0xFF454444),
                          ),
                          onPressed: () {
                            setState(() {
                              isSelected = true;
                            });
                          },
                          child: Text(
                            "General",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(left: 10, right: 10),

                            shape: BeveledRectangleBorder(),
                            backgroundColor: isSelected
                                ? Color(0xffffffff)
                                : Color(0xff528fe6),
                            foregroundColor: isSelected
                                ? Color(0xFF454444)
                                : Color(0xffffffff),
                          ),

                          onPressed: () {
                            setState(() {
                              isSelected = false;
                            });
                          },
                          child: Text(
                            "Class wise",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Expanded(
              child: Consumer<CurriculumProvider>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: isSelected
                        ? value.noticeModel?.genaralNotice?.length ?? 0
                        : curriculumProvider.noticeModel?.classNotice?.length ??
                              0,

                    itemBuilder: (context, index) {
                      var genarlNotice =
                          curriculumProvider.noticeModel?.genaralNotice?[index];
                      var classNotice =
                          curriculumProvider.noticeModel?.classNotice?[index];
                      return isSelected
                          ? NoticeWidget(
                              provider: genarlNotice,
                              index: index,
                              mainProvider: curriculumProvider,
                            )
                          : NoticeWidget(
                              provider: classNotice,
                              index: index,
                              mainProvider: curriculumProvider,
                            );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
