import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  GoogleSignInAccount? currentUser;

  @override
  void initState() {
    super.initState();

    googleSignIn.onCurrentUserChanged.listen((event) {
      setState(() {
        currentUser = event;
      });

      if (currentUser != null) {
        debugPrint("Already Authenticated");
      }
    });
    googleSignIn.signInSilently();
  }

  Future<void> handleSignIn() async {
    try {
      final s = await googleSignIn.signIn();
      debugPrint("soton name: ${s?.displayName} \nsoton email: ${s?.email}");
    } catch (error) {
      debugPrint("error in handleSignIn: $error");
    }
  }

  Future<void> handleSignOut() async => googleSignIn.disconnect();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo"),
      ),
      body: Center(
        child: currentUser == null
            ? Column(
                children: [
                  const Text("Current user is null"),
                  ElevatedButton(
                      onPressed: handleSignIn, child: const Text("Sign IN"))
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Current displayName: ${currentUser?.displayName}"),
                  Text("Current email: ${currentUser?.email}"),
                  ElevatedButton(
                      onPressed: handleSignOut, child: const Text("Sign Out"))
                ],
              ),
      ),
    );
  }
}

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
