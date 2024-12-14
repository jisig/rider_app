import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider_app/pages/order_extension_pages/completed_order.dart';
import 'package:rider_app/pages/order_extension_pages/pending_order.dart';

class Orders extends StatefulWidget {
  const Orders({
    super.key,
  });

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Order History",
          style: GoogleFonts.jost(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 20,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_outlined,
                  color: Theme.of(context).colorScheme.surfaceContainer,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.surfaceContainer,
                ),
              )
            ],
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: TabBar(
            controller: tabController,
            tabAlignment: TabAlignment.fill,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Theme.of(context).colorScheme.inversePrimary,
            indicatorColor: Theme.of(context).colorScheme.primary,
            // isScrollable: true,
            dividerHeight: 0,
            tabs: const [
              Tab(
                child: Text(
                  "Pending Orders",
                ),
              ),
              Tab(
                child: Text(
                  "Completed Orders",
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  children: [
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          PendingOrder(),
                          CompletedOrder(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
