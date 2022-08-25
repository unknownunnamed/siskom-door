import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/user_services.dart';

class CustomAktivitasCard extends StatefulWidget {
  final String datetime, idkartu, ruangan;
  final bool isLock;
  const CustomAktivitasCard(
      {Key? key,
      required this.datetime,
      required this.idkartu,
      required this.ruangan,
      required this.isLock})
      : super(key: key);

  @override
  State<CustomAktivitasCard> createState() => _CustomAktivitasCardState();
}

class _CustomAktivitasCardState extends State<CustomAktivitasCard> {
  String? nama;

  void initData() async {
    UserServices.ref
        .orderByChild('idkartu')
        .equalTo(widget.idkartu)
        .onValue
        .listen((event) {
      setState(() {
        nama =
            event.snapshot.children.toList()[0].child('nama').value.toString();
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
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: NewCustomColor.bgCard,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          Positioned(
              bottom: -(MediaQuery.of(context).size.width / 2.86) / 2.7,
              left: -(MediaQuery.of(context).size.width / 2.86) / 4,
              child: Container(
                height: MediaQuery.of(context).size.width / 2.86,
                width: MediaQuery.of(context).size.width / 2.86,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: NewCustomColor.firstGreenCard),
              )),
          Positioned(
              bottom: -(MediaQuery.of(context).size.width / 5.14) / 2.3,
              left: (MediaQuery.of(context).size.width / 9),
              child: Container(
                height: MediaQuery.of(context).size.width / 5.14,
                width: MediaQuery.of(context).size.width / 5.14,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: NewCustomColor.secondGreenCard),
              )),
          Positioned(
              top: -(MediaQuery.of(context).size.width / 4) / 3,
              right: -(MediaQuery.of(context).size.width / 4) / 4,
              child: Container(
                height: MediaQuery.of(context).size.width / 4,
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: NewCustomColor.secondGreenCard),
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.datetime,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        color: NewCustomColor.primarygray,
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text(nama ?? 'Anonym',
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              color: NewCustomColor.primarygray,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(widget.ruangan,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            color: NewCustomColor.primarygray,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(widget.isLock ? 'Terkunci' : 'Terbuka',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            color: widget.isLock
                                ? NewCustomColor.firstRed
                                : NewCustomColor.textGreenCard,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
