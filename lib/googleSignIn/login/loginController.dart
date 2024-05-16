import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../constants/appRoutes.constant.dart';
import '../../constants/globals.dart';

class LoginController extends GetxController {
  static LoginController to = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxString photoURL = "".obs;
  RxString name = "".obs;
  RxString email = "".obs;
  RxString userId = "".obs;
  CollectionReference ref = Globals.userTableData;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        print("Google login data $googleSignInAccount");
        photoURL.value = googleSignInAccount.photoUrl.toString();
        name.value = googleSignInAccount.displayName.toString();
        email.value = googleSignInAccount.email;
        userId.value = googleSignIn.clientId.toString();
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await _auth.signInWithCredential(credential);
        await saveUserDataToFirebase();
        Get.toNamed(AppRoutes.GOOGLE_DASHBOARD);
      }
    } catch (e) {
      debugPrint('Error while sign in ${e.toString()}');
    }
  }

  Future<void> saveUserDataToFirebase() async {
    User? user = _auth.currentUser;
    var dataBase = ref
        .doc(user!.uid)
        .get();

    if (dataBase != null) {
      ref.doc(user.uid).set({
        'name': name.value,
        'url': photoURL.value,
        'email': email.value,
        'userId': userId.value,

      });
    }
  }



}
