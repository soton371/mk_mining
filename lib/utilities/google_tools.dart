import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);


Future<void> handleSignIn() async {
    try {
      final s = await googleSignIn.signIn();
      debugPrint("soton name: ${s?.displayName} \nsoton email: ${s?.email}");
    } catch (error) {
      debugPrint("error in handleSignIn: $error");
    }
  }