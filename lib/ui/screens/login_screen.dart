// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_erp/controlar/auth_provider.dart';
import 'package:school_erp/ui/widgets/next_button.dart';

class LoginScrenn extends StatefulWidget {
  const LoginScrenn({super.key});

  @override
  State<LoginScrenn> createState() => _LoginScrennState();
}

class _LoginScrennState extends State<LoginScrenn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController scholorContro = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/image/Products.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),

                  Text(
                    "Log in",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Acess your dashboard by logging in",
                    style: TextStyle(fontSize: 14, color: Color(0xFFA8A8A8)),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Scholor No.",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    style: TextStyle(fontSize: 14),
                    keyboardType: const TextInputType.numberWithOptions(),
                    controller: scholorContro,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 10, left: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter a scholor id";
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return "Only numbers allowed";
                      }
                      if (value.length != 10) {
                        return "Mobile number must be 10 digits not ${value.length}";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: NextButton(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          Map<String, dynamic> requestData = {
                            "mobile_no": scholorContro.text,
                          };
                          await data.login(
                            context: context,
                            requestData: requestData,
                          );
                        }
                      },
                      text: "Login",
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
