import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider_app/components/primary_buttons.dart';
import 'package:rider_app/pages/order_extension_pages/location_get_page.dart';

class DeliverOrder extends StatelessWidget {
  const DeliverOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "lib/assets/icons/order_done.png",
                    scale: 2.5,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Order Picked Up for Delivery",
                    style: GoogleFonts.fredoka(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Ready to deliver! Head to the destination to complete the order.",
                    style: GoogleFonts.fredoka(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  PrimaryButton(
                    text: "Start Delivery",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GoogleMapFlutter(),
                        ),
                      );
                    },
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
