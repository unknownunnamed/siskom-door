import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/pintu_services.dart';
import 'package:sisdoor/ui/widgets/custom_appbar.dart';
import 'package:sisdoor/ui/widgets/custom_error_modal.dart';
import 'package:sisdoor/ui/widgets/custom_kendali_card.dart';

class KendaliPintu extends StatefulWidget {
  const KendaliPintu({Key? key}) : super(key: key);

  @override
  State<KendaliPintu> createState() => _KendaliPintuState();
}

class _KendaliPintuState extends State<KendaliPintu> {
  Iterable<DataSnapshot> data = [];

  void initData() async {
    PintuServices.ref.onValue.listen((event) {
      setState(() {
        data = event.snapshot.children;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.neutralWhite,
        appBar: customAppbar(context, "Kendali Pintu"),
        body: SizedBox(
            // padding: EdgeInsets.symmetric(horizontal: 30),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              children: data
                  .map((e) => GestureDetector(
                        onTap: () async {
                          try {
                            await PintuServices.changeLock(
                                e.child('kunci').value.toString() == '1'
                                    ? 0
                                    : 1,
                                e.key.toString(),
                                int.parse(e.child('pagiJam').value.toString()),
                                int.parse(e.child('soreJam').value.toString()),
                                int.parse(
                                    e.child('pagiMenit').value.toString()),
                                int.parse(
                                    e.child('soreMenit').value.toString()));
                          } catch (err) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    customErrorModal(
                                        context, "Terjadi kesalahan"));
                          }
                        },
                        child: CustomKendaliCard(
                          ruangan: e.key.toString(),
                          isOpen: e.child('mSwitch').value.toString() == '1'
                              ? true
                              : false,
                          isLock: e.child('kunci').value.toString() == '0'
                              ? true
                              : false,
                          open:
                              '${e.child('pagiJam').value.toString()}:${e.child('pagiMenit').value.toString()}',
                              close:
                              '${e.child('soreJam').value.toString()}:${e.child('soreMenit').value.toString()}',
                        ),
                      ))
                  .toList(),
            )));
  }
}
