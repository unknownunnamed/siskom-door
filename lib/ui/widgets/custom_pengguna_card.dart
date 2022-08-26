import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/user_services.dart';
import 'package:sisdoor/ui/screens/edit_pengguna.dart';
import 'package:sisdoor/ui/widgets/custom_confirm_modal.dart';
import 'package:sisdoor/ui/widgets/custom_success_modal.dart';

class CustomPenggunaCard extends StatelessWidget {
  final DataSnapshot dataUser;
  const CustomPenggunaCard({Key? key, required this.dataUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 19, left: 30, right: 30),
      width: MediaQuery.of(context).size.width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: CustomColor.neutralWhite,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(dataUser.child('nama').value.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              color: NewCustomColor.primarygray,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(dataUser.child('email').value.toString(),
                          style: TextStyle(
                              fontFamily: 'Inter',
                              color: NewCustomColor.primarygray,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditPengguna(
                                      dataUser: dataUser,
                                    )));
                      },
                      child: Container(
                        width: 37,
                        height: 37,
                        decoration: BoxDecoration(
                            color: NewCustomColor.secondBlue,
                            shape: BoxShape.circle),
                        child: Center(
                          child: Icon(
                            Icons.edit,
                            size: 22,
                            color: CustomColor.neutralWhite,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                customConfirmModal(context, (() async {
                                  UserServices.deleteUser(
                                      dataUser.key.toString(),
                                      dataUser.child('email').value.toString(),
                                      dataUser
                                          .child('password')
                                          .value
                                          .toString(),
                                      dataUser
                                          .child('idkartu')
                                          .value
                                          .toString());
                                  Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (context) => customSuccessModal(
                                          context, 'Data berhasil di delete'));
                                })));
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
