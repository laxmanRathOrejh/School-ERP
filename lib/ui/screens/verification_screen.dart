import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:school_erp/ui/widgets/next_button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String pin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        shadowColor: const Color(0xFFF8F8F8),
        backgroundColor: const Color(0xFFFBFBFB),
        elevation: 2,
        leadingWidth: 45,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFECECEC),
            radius: 15,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 15),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/image/Services.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                Text(
                  "Pin Verfication",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Please enter your 4-digit Pin to continue",
                  style: TextStyle(color: Color(0xFFA8A8A8)),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Pin",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 5.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: MaterialPinField(
                        length: 4,
                        onCompleted: (pin) {
                          pin = pin;
                        },
                        obscureText: true,
                        theme: MaterialPinTheme(
                          shape: MaterialPinShape.outlined,
                          focusedBorderColor: Colors.blue,
                          focusedFillColor: Color(0xFFF6F3F3),
                          fillColor: Color(0xFFF6F3F3),
                          filledFillColor: Color(0xFFF6F3F3),
                          cellSize: Size(80, 48),
                          borderRadius: BorderRadius.circular(12),
                          spacing: 11,
                        ),
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ],
                ),

                /////////
                const SizedBox(height: 10.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 3),
                      child: Text(
                        "Forgot Pin ?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color(0xFFF10707),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10.0),
                NextButton(onTap: () {}, text: "Login"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
