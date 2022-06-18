import 'package:flutter/material.dart';

import '../../widget/inbox/coupon_tab.dart';
import '../../widget/inbox/message_tab.dart';

// ignore: must_be_immutable
class InboxScreen extends StatefulWidget {
  InboxScreen(this.appBarSize, this.context, {Key? key}) : super(key: key);
  double appBarSize;
  // ignore: prefer_typing_uninitialized_variables
  var context;
  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  double boxSize = 0;
  int? index;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: LayoutBuilder(builder: (context, constraint) {
                  boxSize = constraint.maxHeight;
                  return TabBar(
                      indicator: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8.0)),
                      unselectedLabelColor: Colors.black,
                      tabs: const [
                        Tab(
                          text: 'Messages',
                        ),
                        Tab(
                          text: 'Coupons',
                        ),
                        Tab(
                          text: 'Promotions',
                        )
                      ]);
                }),
              ),
            ),
            // Center(
            //   child: ToggleSwitch(
            //     fontSize: 18.0,
            //     cornerRadius: 5.0,
            //     totalSwitches: 3,
            //     initialLabelIndex: 0,
            //     minWidth: 350.0,
            //     labels: const ['Messages', 'Coupons', 'Promotions'],
            //     onToggle: (index) {
            //       if (kDebugMode) {
            //         print('switched to: $index');
            //       }
            //     },
            //     activeBgColor: const [Colors.orange],
            //     inactiveBgColor: Colors.white,
            //   ),
            // ),
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                  widget.appBarSize -
                  (boxSize + 100)),
              child: LayoutBuilder(builder: (context, constarints) {
                return TabBarView(

                  children: [
                    const MessageTab(),
                    const CouponTab(),
                    Container(),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}



/*

TabBarView(
              viewportFraction: 0.9,
              children: [
                Container(
                  child: Card(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                              child: Image.asset("assets/images/image2.png")),
                          Title(
                            color: Colors.black,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Jack Gamble"),
                                Text("5 min ago")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.amber,
                ),
                Container(),
              ],
            ),


            */