import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_erp/controlar/fess_provider.dart';
import 'package:school_erp/model/session_model.dart';
import 'package:school_erp/ui/screens/fess_history_screen.dart';
import 'package:school_erp/ui/screens/fess_payment_screen.dart';
import 'package:school_erp/ui/widgets/appbar_widget.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';
import 'package:school_erp/ui/widgets/next_button.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';

class FessScreen extends StatefulWidget {
  final bool fromBottomNav;
  final bool forFessHistory;

  const FessScreen({
    super.key,
    required this.forFessHistory,
    required this.fromBottomNav,
  });

  @override
  State<FessScreen> createState() => _FessScreenState();
}

List emtyList = [];

class _FessScreenState extends State<FessScreen> {
  final _formKey = GlobalKey<FormState>();
  int? selectedClass;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FessProvider>().getSession(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var sesionProvider = Provider.of<FessProvider>(context, listen: false);
    return Scaffold(
      appBar: widget.fromBottomNav
          ? AppbarWidget(
              titleText: "Fess",
              onMenuTap: () {
                Scaffold.of(context).openDrawer();
              },
            )
          : AppbarWithBackWidget(titleText: "Fess"),
      body: Container(
        color: Color(0xfff0f0f0),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 50),
          child: Form(
            key: _formKey,
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
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Consumer<FessProvider>(
                      builder: (context, value, child) {
                        return DropdownButtonFormField<SessionData>(
                          icon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 28,
                            ),
                          ),
                          //    initialValue: selectedClass,
                          isExpanded: true,
                          focusColor: Color(0xffdeeef8),
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffffffff),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
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
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                            ),
                          ),
                          items: (sesionProvider.sessionData?.sessian ?? [])
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item.year ?? ""),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedClass = value?.id ?? 0;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return "Select Session First ";
                            }
                            return null;
                          },
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: NextButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => widget.forFessHistory
                                  ? FissHistoryScreem(id: selectedClass ?? 0)
                                  : FessPaymentScreen(id: selectedClass ?? 0),
                            ),
                          );
                        }
                      },
                      text: "Continue",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
