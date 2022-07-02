import 'package:sisdoor/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthFirebase {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<String> signIn(email, password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      DataSnapshot data = await UserServices.ref.child(user.uid).get();
      return data.child('status').value.toString();
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Future<String> addUser(String email, String password) async {
    try {
      List<String> data = await AuthFirebase.getEmailPassword();
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await _auth.signOut();
      await AuthFirebase.signIn(data[0], data[1]);
      return userCredential.user!.uid;
    } catch (e) {
      throw e.toString();
    }
  }


  static Future<List<String>> getEmailPassword() async {
    User? user = _auth.currentUser;
    DataSnapshot data =
        await UserServices.ref.orderByKey().equalTo(user!.uid).get();
    String emailAdmin = data.child("${user.uid}/email").value.toString();
    String passwordAdmin = data.child("${user.uid}/password").value.toString();

    return [emailAdmin, passwordAdmin];
  }

  static Future<void> removeUser(String email, String password) async {
    await _auth.signOut();
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User newuser = result.user!;
    await newuser.delete();
  }
}
