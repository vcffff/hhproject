import 'package:firebase_auth/firebase_auth.dart';
import 'package:hhproject/features/auth/data/models/User_model.dart';

class AuthDatasources {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> loginrequest(String email, String password) async {
    final userCred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCred.user!;
    return UserModel(
      name: user.displayName ?? "",
      email: user.email ?? "",
      id: user.uid,
    );
  }

  Future<UserModel> registerrequest(String email, String password) async {
    final userCred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCred.user!;
    return UserModel(
      name: user.displayName ?? "",
      email: user.email ?? "",
      id: user.uid,
    );
  }

  Future<void> logoutrequest() async {
    await _auth.signOut();
  }
}
