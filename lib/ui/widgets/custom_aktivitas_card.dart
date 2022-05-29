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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.only(bottom: 10, left: 30, right: 30),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: CustomColor.neutralWhite,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: CustomColor.neutralGray.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.datetime,
              style: TextStyle(
                  color: CustomColor.neutralBlack,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
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
                        color: CustomColor.neutralBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 5,
              ),
              Text(widget.ruangan,
                  style: TextStyle(
                      color: CustomColor.neutralGray,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                height: 5,
              ),
              Text(widget.isLock ? 'Terkunci' : 'Terbuka',
                  style: TextStyle(
                      color: widget.isLock
                          ? CustomColor.primaryRose
                          : CustomColor.secondaryGreen,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
            ],
          )
        ],
      ),
    );
  }
}
