import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:rider_app/components/custom_navigation_bar.dart';
import 'package:rider_app/components/primary_buttons.dart';
import 'package:rider_app/pages/main_pages/dashboard.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                Text(
                  "Login",
                  style: GoogleFonts.fredoka(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  "Enter your 4-digit passcode",
                  style: GoogleFonts.fredoka(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
                const SizedBox(height: 15),
                Pinput(
                  length: 4,
                  controller: pinController,
                  defaultPinTheme: PinTheme(
                    height: 50,
                    width: 50,
                    textStyle: GoogleFonts.fredoka(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.surface,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // PrimaryButton(
                //   text: "Login",
                //   onPressed: () {
                //     if (pinController.text == "") {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(
                //           backgroundColor:
                //               Theme.of(context).colorScheme.primaryFixedDim,
                //           content: Text('Please enter your passcode'),
                //         ),
                //       );
                //     } else if (pinController.text == "1234") {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(
                //           backgroundColor:
                //               Theme.of(context).colorScheme.primaryFixedDim,
                //           content: Text(
                //               'Incorrect passcode. Please enter correct passcode!'),
                //         ),
                //       );
                //     } else {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => Dashboard()));
                //     }
                //   },
                // ),
                PrimaryButton(
                  text: "Login",
                  onPressed: () {
                    if (pinController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryFixedDim,
                          content: Text('Please enter your passcode'),
                        ),
                      );
                    } else if (pinController.text == "1234") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomNavigationBar(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryFixedDim,
                          content:
                              Text('Incorrect passcode. Please try again!'),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
