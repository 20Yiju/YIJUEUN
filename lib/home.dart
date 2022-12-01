import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Login/login.dart';
import 'editDiary.dart';
import 'enterDiary.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> _children = [const HomePage(), const EnterDiary()];

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
                    child: Text("${snapshot.data?.displayName}님 반갑습니다:D", style: const TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  const SizedBox(height: 200,),
                  ElevatedButton(
                    child: Text('일기장 만들기'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xff5784A1)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/addDiary');
                    },
                  ),
                  ElevatedButton(
                    child: Text('일기장 입장'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xff5784A1)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/enterDiary');
                    },
                  ),
                  ElevatedButton(
                    child: Text('일기장 custom'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xff5784A1)),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditDiary('diary1')));
                    },
                  ),
                ],
              ),
            ],
          );
        };

        }
      ),
      /*bottomNavigationBar: BottomAppBar(
        color: Color(0xff629E44),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.home_filled),
              onPressed: () {},
            ),
          ],
        ),color:
      ),*/
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Color(0xff629E44)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: currentIndex,
          onTap: (index) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _children[index]),
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color:Colors.white,),
              label: '홈',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '검색'
            ),

          ],
          selectedItemColor: Colors.white,
          // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
          unselectedItemColor: Colors.white,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}