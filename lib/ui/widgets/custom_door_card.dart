import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/pintu_services.dart';
import 'package:sisdoor/ui/widgets/custom_confirm_modal.dart';
import 'package:sisdoor/ui/widgets/custom_success_modal.dart';

class CustomDoorCard extends StatelessWidget {
  final DataSnapshot dataPintu;
  const CustomDoorCard({Key? key, required this.dataPintu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 22, left: 30, right: 30),
      width: MediaQuery.of(context).size.width,
      clipBehavior: Clip.hardEdge,
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
      child: Stack(
        children: [
          Positioned(
              bottom: -(MediaQuery.of(context).size.width / 3.57) / 2,
              left: -(MediaQuery.of(context).size.width / 3.57) / 4,
              child: Container(
                height: MediaQuery.of(context).size.width / 3.57,
                width: MediaQuery.of(context).size.width / 3.57,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: NewCustomColor.firstGreenCard),
              )),
          Positioned(
              bottom: -(MediaQuery.of(context).size.width / 6.36) / 1.6,
              left: (MediaQuery.of(context).size.width / 9),
              child: Container(
                height: MediaQuery.of(context).size.width / 6.36,
                width: MediaQuery.of(context).size.width / 6.36,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: NewCustomColor.secondGreenCard),
              )),
          Positioned(
              top: -(MediaQuery.of(context).size.width / 4) / 2,
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
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(dataPintu.key.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Inter',
                          color: NewCustomColor.primarygray,
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            customConfirmModal(context, () async {
                              PintuServices.deletePintu(
                                  dataPintu.key.toString());
                              Navigator.pop(context);
                              showDialog(
                                  context: context,
                                  builder: (context) => customSuccessModal(
                                      context, 'Ruangan berhasil di delete'));
                            }));
                  },
                  child: Container(
                    width: 37,
                    height: 37,
                    decoration: BoxDecoration(
                        color: NewCustomColor.secondRed,
                        shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                        Icons.delete,
                        size: 22,
                        color: CustomColor.neutralWhite,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
