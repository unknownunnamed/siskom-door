import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/ui/widgets/custom_appbar.dart';
import 'package:sisdoor/ui/widgets/custom_monitoring_card.dart';

class Monitoring extends StatelessWidget {
  const Monitoring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.neutralWhite,
        appBar: customAppbar(context, "Monitoring Pengguna"),
        body: SizedBox(
            // padding: EdgeInsets.symmetric(horizontal: 30),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              children: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                  .map((e) => CustomMonitoringCard(
                        date: "3 Maret 2022",
                        name: "Tengku Nopriyanti Murti",
                        ruangan: "Lab A",
                      ))
                  .toList(),
            )));
  }
}
