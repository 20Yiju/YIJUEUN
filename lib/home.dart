import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (!snapshot.hasData) {
          return const LoginPage();
        }
        else{
          return ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 150,
                    child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/yijueun-a1290.appspot.com/o/images%2Fhome_logo.jpeg?alt=media&token=cb09a7db-b289-4f14-a618-cb4914b1be08'
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                    child: const Text(
                      '안녕하세요, ' + '${snapshot.data?.displayName}님 :D',
                    ),
                  ),
                ],
              ),
            ],
          ),
        };

        }
      ),
    );
  }
}