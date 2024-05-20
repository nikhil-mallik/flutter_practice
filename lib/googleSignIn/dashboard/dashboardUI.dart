import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../constants/appRoutes.constant.dart';

class DashboardUI extends StatelessWidget {
  DashboardUI({super.key});

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;
  TextEditingController title = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('Users');
  String url =
      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pxfuel.com%2Fen%2Fquery%3Fq%3Dcute%2Bboy%2Bcartoon&psig=AOvVaw0-xMy0LLLzNOmXPQNMAUe4&ust=1715940927321000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPjYoZ34kYYDFQAAAAAdAAAAABAE';
  var options = [
    'PDF',
    'Image',
    'Video',
  ];
  bool value = false;
  var _currentItemSelected = "Video";

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .collection('folders')
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          radius: 50, // Image radius
          backgroundImage: NetworkImage(
            url,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _googleSignIn.signOut().then((value) {
                Get.offAllNamed(AppRoutes.HOME);
              }).catchError((e) {});
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
        backgroundColor: Colors.indigo[900],
        title: Row(
          children: [
            const Text(
              'Flutter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
            ),
            Text(
              'Practice',
              style: TextStyle(
                color: Colors.yellow[700],
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: AnimatedButton(
          height: 70,
          width: 200,
          text: 'Logout',
          isReverse: true,
          selectedTextColor: Colors.black,
          transitionType: TransitionType.LEFT_TO_RIGHT,
          // textStyle: submitTextStyle,
          backgroundColor: Colors.red,
          borderColor: Colors.white,
          borderRadius: 50,
          borderWidth: 2,
          onPress: () {
            _googleSignIn.signOut().then((value) {
              Get.offAllNamed(AppRoutes.HOME);
            }).catchError((e) {});
          },
        ),
      ),
      /*  body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
                  return GestureDetector(
                    onTap: () {
                      debugPrint(
                        data['type']
                      );
                      debugPrint(document.id);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (upload(
                            url: url,
                            did: document.id,
                            type: data['type'],
                          )),
                        ),
                      );
                    },
                    child: ListTile(
                      // leading: (data['type'] == "PDF" || data['type'] == "Image")
                      //     ? ((data['type'] == "PDF")
                      //         ? (Icon(
                      //             Icons.picture_as_pdf,
                      //           ))
                      //         : (Icon(
                      //             Icons.image,
                      //           )))
                      //     : (Icon(
                      //         Icons.play_circle_fill,
                      //       )),
                      leading: Icon(
                        Icons.folder,
                        color: Colors.amber[300],
                        size: 50,
                      ),
                      title: Text(data['name']),
                      subtitle: Text(data['type']),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          Positioned(
            bottom: 10,
            // left: 0,
            right: 10,
            child: Center(
              child: FloatingActionButton(
                onPressed: () async {
                  await showInformationDialog(context);
                },
                child: const Icon(
                  Icons.add,
                ),
              ),
            ),
          )
        ],
      ),*/
    );
  }

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        bool isChecked = false;
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: Form(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: title,
                  validator: (value) {
                    return null;
                  
                    // return value.isNotEmpty ? null : "Enter any text";
                  },
                  decoration:
                      const InputDecoration(hintText: "Please Enter Text"),
                ),
                const SizedBox(
                  height: 40,
                ),
                DropdownButton<String>(
                  dropdownColor: const Color.fromARGB(255, 147, 189, 253),
                  isDense: true,
                  isExpanded: false,
                  iconEnabledColor: const Color.fromARGB(255, 47, 0, 255),
                  // focusColor: Color.fromARGB(255, 245, 245, 245),
                  items: options.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValueSelected) {
                    setState(() {
                      _currentItemSelected = newValueSelected!;
                      print(_currentItemSelected);
                    });
                  },
                  value: _currentItemSelected,
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            )),
            title: const Text('Stateful Dialog'),
            actions: <Widget>[
              InkWell(
                child: const Text('Cancel'),
                onTap: () {
                  Navigator.of(context).pop();
                  // }
                },
              ),
              const SizedBox(
                width: 40,
              ),
              InkWell(
                child: const Text('Create'),
                onTap: () {
                  if (title.text != '') {
                    User? user = _auth.currentUser;
                    ref.doc(user!.uid).collection('folders').add({
                      'name': title.text,
                      'type': _currentItemSelected,
                    });
                    title.clear();
                    Navigator.of(context).pop();
                  }
                },
              ),
              const SizedBox(
                width: 40,
              ),
            ],
          );
        });
      },
    );
  }
}
