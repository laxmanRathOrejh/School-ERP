import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  PinInputController pinController = PinInputController();

  String pin = '';
  void addNumber(String number) {
    if (pin.length < 4) {
      setState(() {
        pin += number;
        pinController.text = pin;
      });
    }
  }

  void removeNumber() {
    if (pin.isNotEmpty) {
      setState(() {
        pin = pin.substring(0, pin.length - 1);
        pinController.text = pin;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var providerData = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppbarWithBackWidget(titleText: "Create New Pin"),
      body: SafeArea(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),

                const SizedBox(height: 80),

                const Text(
                  "Add a Pin Number to Make Your Account more Secure",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Color(0xFF181717)),
                ),
                const SizedBox(height: 50),

                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: MaterialPinField(
                      readOnly: true,
                      autoFocus: false,
                      pinController: pinController,

                      // autoFocus: true,
                      onChanged: (value) {
                        setState(() {
                          pin = value;
                        });
                      },
                      length: 4,
                      onCompleted: (value) {
                        setState(() {
                          pin = value;
                        });
                      },
                      obscureText: true,
                      theme: MaterialPinTheme(
                        shape: MaterialPinShape.outlined,
                        focusedBorderColor: Colors.blue,
                        focusedFillColor: Color(0xFFF6F3F3),
                        fillColor: Color(0xFFF6F3F3),
                        filledFillColor: Color(0xFFF6F3F3),
                        cellSize: Size(70, 60),
                        borderRadius: BorderRadius.circular(12),
                        spacing: 20,
                      ),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                ),
                SizedBox(height: 160),
                // Expanded(child: SizedBox(width: 9)),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.only(bottom: 20),
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.8,
                    ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      if (index == 9) {
                        return SizedBox(
                          child: InkWell(
                            onTap: () {}, // addNumber("*"),
                            child: Center(
                              child: Text("*", style: TextStyle(fontSize: 22)),
                            ),
                          ),
                        );
                      }

                      if (index == 11) {
                        return IconButton(
                          icon: const Icon(Icons.backspace),
                          onPressed: removeNumber,
                        );
                      }

                      String number = (index == 10) ? "0" : "${index + 1}";

                      return SizedBox(
                        child: InkWell(
                          onTap: () => addNumber(number),
                          child: Center(
                            child: Text(number, style: TextStyle(fontSize: 21)),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // NextButton(
                //   onTap: () {
                //     Map<String, dynamic> requestData = {"pin": pin};
                // await data.pinVerfication(
                //   context: context,
                //   requestData: requestData,
                // );
                // if (data.tokan.isNotEmpty) {
                //   saveToken(data.tokan);
                //   Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => DashboardScreen(),
                //     ),
                //    );
                //    }
                //   },
                // text: "Login",
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
