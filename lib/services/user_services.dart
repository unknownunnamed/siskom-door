import 'package:firebase_database/firebase_database.dart';
import 'package:sisdoor/services/firebase_auth.dart';
import 'package:sisdoor/services/rfid_services.dart';

class UserServices {
  static DatabaseReference ref = FirebaseDatabase.instance.ref("user");

  static Stream<DatabaseEvent> getAkun(uid) {
    DatabaseReference child = ref.child(uid);
    return child.onValue;
  }

  static Future<void> addUser(String email, String password, String rfid,
      String phone, String nama) async {
    try {
      String uid = await AuthFirebase.addUser(email, password);
      await ref.child(uid).set({
        "idkartu": rfid,
        "email": email,
        "password": password,
        "nama": nama,
        "noHP": phone,
        "status": 0,
      });
      await RFIDServices.changeStatus(rfid, 1);
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<void> updateUser(String rfidold, String rfidnew, String phone,
      String nama, String uid) async {
    try {
      if (rfidnew == rfidold) {
        await ref.child(uid).update({"phone": phone, "nama": nama});
      } else {
        await ref.child(uid).update({"phone": phone, "nama": nama, 'idkartu': rfidnew});
        await RFIDServices.changeStatus(rfidold, 0);
        await RFIDServices.changeStatus(rfidnew, 1);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<void> deleteUser(
      String uid, String email, String password, String id) async {
    List<String> result = await AuthFirebase.getEmailPassword();
    await AuthFirebase.removeUser(email, password);
    await AuthFirebase.signIn(result[0], result[1]);
    await ref.child(uid).remove();
    await RFIDServices.changeStatus(id, 0);
  }
}
