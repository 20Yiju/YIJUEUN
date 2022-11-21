import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AddDiary extends StatelessWidget {
  const AddDiary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Suit',
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const AddStatefulWidget(),
    );
  }
}

class AddStatefulWidget extends StatefulWidget {
  const AddStatefulWidget({Key? key}) : super (key: key);

  @override
  State<AddStatefulWidget> createState() => AddStateWidget();
}

class AddStateWidget extends State<AddStatefulWidget> {
  late String name, number, description, url;
  FirebaseAuth auth = FirebaseAuth.instance;
  final inputController1 = TextEditingController();
  final inputController2 = TextEditingController();
  final inputController3 = TextEditingController();
  final inputController4 = TextEditingController();
  final inputController5 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('새로운 일기장 만들기'),
          leading:  IconButton(
              onPressed: () {
                //뒤로가기
              },
              color: Colors.white,
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: const Color(0xff485ed9),
        ),
        body: Center(
            child: GestureDetector(
                onTap: ()=> FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                    child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '일기장 제목',
                                ),
                                onChanged: (String? newValue) {
                                  name = newValue!;
                                  print(name);
                                },
                                validator: (value) {
                                  if(value!.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                controller: inputController1
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '일기장 설명',
                                ),
                                onChanged: (String? newValue) {
                                  name = newValue!;
                                  print(name);
                                },
                                validator: (value) {
                                  if(value!.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                controller: inputController5
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: '일기장 비밀번호',
                              ),
                              onChanged: (String? newValue) {
                                number = newValue!;
                                print(number);
                              },
                              validator: (value) {
                                if(value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              controller: inputController2,
                            ),
                          ),
                          Center(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0)
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.fromLTRB(30, 10, 30, 10),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    //Color.fromARGB(255, 74, 170, 248)
                                      const Color(0xff485ed9)
                                  ),
                                ),

                                onPressed: () {
                                  /*final userCollectionReference = FirebaseFirestore
                                      .instance.collection("users").doc(
                                      auth.currentUser!.displayName.toString());
                                  userCollectionReference.update({
                                    'study': FieldValue.arrayUnion(
                                        [inputController1.text])});
                                  userCollectionReference.collection("achievement").doc(inputController1.text).set({
                                    "개인별": 0,
                                    "성취도": 0,
                                  });*/

                                  // final studyCollectionReference = FirebaseFirestore
                                  //     .instance.collection("study").doc(
                                  //     inputController1.text);
                                  // studyCollectionReference.update({
                                  //   'member': 1 });
                                  // print("member count: ${member[index]}");

                                  /*final studyCollectionReference = FirebaseFirestore.instance.collection("study").doc(inputController1.text);
                                  studyCollectionReference.set({
                                    "studyName": inputController1.text,
                                    "number": inputController2.text,
                                    "description": inputController3.text,
                                    "url": inputController4.text,
                                    "heart": false,
                                    "hostName": inputController5.text,
                                    "member": 1,
                                  });*/
                                  Navigator.pushNamed(context, '/home2');
                                },
                                child: const Text('등록',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                              )
                          ),
                          const SizedBox(height: 20,),

                        ]
                    )
                )
            )
        )

    );
  }
}