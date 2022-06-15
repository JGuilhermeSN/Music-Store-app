// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:musicstore_app/user/user_local.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
// FirebaseFirestore = _firestore = FirebaseFirestore.instance;

class UserServices {
  UserLocal? userLocal;
  //metodo para realizar a autenticação
  Future<void> signIn(UserLocal userLocal,
      {Function? onSucces, Function? onFail}) async {
    try {
      User? user = (await _auth.signInWithEmailAndPassword(
              email: userLocal.email!, password: userLocal.password!))
          .user;
      this.userLocal = userLocal;
      this.userLocal!.id = user!.uid;
      onSucces!();
    } on PlatformException catch (e) {
      onFail!(debugPrint(e.toString()));
    }
  }

  // metodo de registro
  Future<void> signUp(UserLocal userLocal,
      {Function? onSucces, Function? onFail}) async {
    try {
      User? user = (await _auth.createUserWithEmailAndPassword(
              email: userLocal.email!, password: userLocal.password!))
          .user;
      this.userLocal = userLocal;
      this.userLocal!.id = user!.uid;
      onSucces!();
    } catch (e) {
      onFail!(e);
    }
  }
}
