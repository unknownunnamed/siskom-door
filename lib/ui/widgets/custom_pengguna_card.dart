import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/user_services.dart';
import 'package:sisdoor/ui/screens/edit_pengguna.dart';

class CustomPenggunaCard extends StatelessWidget {
  final DataSnapshot dataUser;
  const CustomPenggunaCard({Key? key, required this.dataUser})
      : super(key: key);

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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(dataUser.child('nama').value.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: CustomColor.neutralBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(dataUser.child('email').value.toString(),
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: CustomColor.neutralGray,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
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
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: CustomColor.secondaryTorea,
                      shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.edit,
                      size: 15,
                      color: CustomColor.neutralWhite,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () async {
                  UserServices.deleteUser(
                      dataUser.key.toString(),
                      dataUser.child('email').value.toString(),
                      dataUser.child('password').value.toString(),
                      dataUser.child('idkartu').value.toString());
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: CustomColor.primaryRose, shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      size: 15,
                      color: CustomColor.neutralWhite,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
