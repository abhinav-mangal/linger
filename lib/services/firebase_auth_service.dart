import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<Resource?> signInWithGoogle(
      [bool link = false, AuthCredential? authCredential]) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (link) {
        await linkProviders(userCredential, authCredential!);
      }
      return Resource(status: Status.success, data: userCredential);
    } on FirebaseAuthException {
      return Resource(status: Status.error, data: null);
    }
  }

  static Future<UserCredential?> linkProviders(
      UserCredential userCredential, AuthCredential newCredential) async {
    return await userCredential.user!.linkWithCredential(newCredential);
  }

  static Future<Resource?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          final userCredential =
              await _auth.signInWithCredential(facebookCredential);
          return Resource(status: Status.success, data: userCredential);
        case LoginStatus.cancelled:
          return Resource(status: Status.canceled, data: null);
        case LoginStatus.failed:
          return Resource(status: Status.error, data: null);
        default:
          return null;
      }
    } on FirebaseAuthException {
      return Resource(status: Status.error, data: null);
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}

class Resource {
  final Status status;
  final UserCredential? data;

  Resource({required this.status, this.data});
}

enum Status {
  success,
  error,
  canceled,
}

enum LoginType { google, facebook }
