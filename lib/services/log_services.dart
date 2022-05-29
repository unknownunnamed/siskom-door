import 'package:firebase_database/firebase_database.dart';

class LogServices {
  static DatabaseReference ref = FirebaseDatabase.instance.ref('log');
}