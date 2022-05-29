import 'package:firebase_database/firebase_database.dart';

class PintuServices {
  static DatabaseReference ref = FirebaseDatabase.instance.ref("pintu");

  static Future<void> changeOperasionalOpen(
      String pintu, String jamOpen, String menitOpen) async {
    try {
      await ref.child(pintu).update({
        'pagiJam': jamOpen,
        'pagiMenit': menitOpen,
      });
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<void> changeOperasionalClose(
      String pintu, String jamClose, String menitClose) async {
    try {
      await ref
          .child(pintu)
          .update({'soreJam': jamClose, 'soreMenit': menitClose});
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<int> changeLock(int kunci, String pintu, int jamOpen,
      int jamClose, int menitOpen, int menitClose) async {
    try {
      DateTime now = DateTime.now();
      print(menitClose);
      if (now.hour > jamOpen && now.hour < jamClose) {
        await ref.child(pintu).update({'kunci': kunci});
      } else if (now.hour == jamOpen &&
          now.minute >= menitOpen &&
          jamClose != jamOpen) {
        await ref.child(pintu).update({'kunci': kunci});
      } else if (now.hour == jamClose &&
          now.minute < menitClose &&
          jamClose != jamOpen) {
        await ref.child(pintu).update({'kunci': kunci});
      } else if (now.minute >= menitOpen &&
          now.minute < menitClose &&
          jamClose == jamOpen) {
        await ref.child(pintu).update({'kunci': kunci});
      } else {
        throw 'Sudah diluar jam operasional';
      }
      return kunci;
    } catch (e) {
      throw e.toString();
    }
  }
}
