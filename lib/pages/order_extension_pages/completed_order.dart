import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'order_completed_detail_page.dart';

class CompletedOrder extends StatelessWidget {
  const CompletedOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderCompletedDetailsPage(),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Delivered',
                                  style: GoogleFonts.fredoka(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '#1200523',
                                  style: GoogleFonts.fredoka(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${"Name: "}Irfan Shaikh",
                                      style: GoogleFonts.fredoka(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Text(
                                        "${"Address: "}501, Rushiraj House, Behind Yes Bank, Thatte Nagar, Nashik - 422005",
                                        style: GoogleFonts.fredoka(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Mobile: ${"+91 8459002801"}',
                                      style: GoogleFonts.fredoka(
                                        fontSize: 16,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.delivery_dining,
                                  size: 40,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ],
                            ),
                            Divider(
                              height: 25,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            Text(
                              "Delivered on: ${"12/12/2024"}, ${"10:00 am"}",
                              style: GoogleFonts.fredoka(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
