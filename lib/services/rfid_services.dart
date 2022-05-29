import 'package:firebase_database/firebase_database.dart';

class RFIDServices {
  static DatabaseReference ref = FirebaseDatabase.instance.ref('rfid');

  static Future<void> changeStatus(String id, int newStatus) async {
    try {
      ref.orderByChild('ID').equalTo(id).once().then((value) async {
        await ref
            .child(value.snapshot.children.toList()[0].key.toString())
            .update({'status': newStatus});
      });
    } catch (e) {
      rethrow;
    }
  }
}
