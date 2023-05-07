import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final databaseRef = FirebaseFirestore.instance.collection('users');

FirebaseAuth auth = FirebaseAuth.instance;
User? user = auth.currentUser;


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 57, 70, 72),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100),
            ),
            Text(
              'Hello, $user! {INSERT TIMER HERE}',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 100),
            ),
            const Icon(
              Icons.circle_sharp,
              color: Colors.blue,
              size: 100.0,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 100),
            ),
            Container(
                color: Colors.white,
                height: 380,
                width: double.infinity,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        "Friends Current Toggled",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 15, bottom: 15, left: 5),
                          child: Text("User Online 1"),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 15, bottom: 15, left: 5),
                          child: Text("User Online 2"),
                        ),
                        Divider(
                          color: Colors.black,
                        )
                      ],
                    ),
                  ],
                )),
            BottomNavigationBar(
                backgroundColor: Color.fromARGB(255, 197, 196, 196),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_add_alt),
                  label: 'Friends',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Events',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_2),
                  label: 'Profile',
                ),
              ],
                selectedItemColor: Colors.red,

            ),
            
          ],
        )));
  }
}
