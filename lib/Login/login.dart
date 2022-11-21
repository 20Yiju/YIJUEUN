import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import '../firebase_options.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(clientId: DefaultFirebaseOptions.currentPlatform.iosClientId).signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    /*final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);

    final String? uid = authResult.user?.uid;
    final String? email = authResult.user?.email;
    final String? name = authResult.user?.displayName;
    final String? image = authResult.user?.photoURL;
    final String? status_msg = "I promise to take the test honestly before GDO";

    FirebaseFirestore.instance.collection('users').doc(uid).set({
      'email' : email,
      'name' : name,
      'userId' : uid,
      'image' : image
    });*/


    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F6A3),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 50.0),
            Image.network("https://firebasestorage.googleapis.com/v0/b/yijueun-a1290.appspot.com/o/images%2Flogin.jpg?alt=media&token=c27f5ac0-99af-439a-9717-ea21a5ed55f8",
            width: 400,
            height: 400,),

            const SizedBox(height: 70.0),
            ElevatedButton(
              child: Text('Google'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff5784A1)),
              ),
              onPressed: () {
                signInWithGoogle().then((value) => Navigator.pushNamed(context, '/home2'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
