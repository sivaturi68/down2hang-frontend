import 'package:down_two_hang/components/toggle.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'color_palette.dart';
import 'profile.dart';
import 'events.dart';
import 'friends.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    if (index == 0) {
      setState(() {
        _currentIndex = index;
      });
      // Navigate to the first tab's page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FriendsPage()),
      );
    } else if (index == 1) {
      setState(() {
        _currentIndex = index;
      });
      // Navigate to the second tab's page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EventsPage()),
      );
    } else if (index == 2) {
      setState(() {
        _currentIndex = index;
      });
      // Navigate to the profile page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } else {
      // Update the current index for other cases
      setState(() {
        _currentIndex = index;
      });
    }
  }

  bool value = false;
  final databaseRef = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;

  // function changes the status of the 'isOnline' variable
  void updateUserOnlineStatus(bool isOnline) {
    if (user != Null) {
      databaseRef.doc(user?.uid).update({
        'isOnline': isOnline,
        'timeOfDown': Timestamp.now(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var username = user?.displayName ?? "null user";
    var timerMessage = '';
    databaseRef.doc(user?.uid).get().then((doc) {
      final data = doc.data() as Map<String, dynamic>;
      if (data.keys.contains('isOnline')) {
        if (data['isOnline']) {
          if (data.keys.contains('timeOfDown')) {
            var timeDiff = DateTime.now()
                .difference((data['timeOfDown'] as Timestamp).toDate());
            if (timeDiff.inMinutes < 1) {
              timerMessage = 'You just went online!';
            } else {
              timerMessage = 'You\'ve been online for $timeDiff';
            }
          } else {
            throw Exception('timeOfDown field doesn\'t exist');
          }
        } else {
          timerMessage = 'You are online';
        }
      } else {
        throw Exception('isOnline field doesn\'t exist');
      }
    }, onError: (e) => print(e));
    return Scaffold(
      backgroundColor: colors[1],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100),
            ),
            Text(
              'Hello, $username!',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            Text(
              timerMessage,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            const Text(
              'Are You Down?',
              textScaleFactor: 2,
            ),
            SwitchButton(
              value: value,
              onChanged: (newValue) {
                setState(() {
                  value = newValue;
                  updateUserOnlineStatus(newValue);
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 75),
            ),
            Container(
                color: Colors.white,
                height: 380,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
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
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15, left: 5),
                      child: Text("User Online 1"),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15, left: 5),
                      child: Text("User Online 2"),
                    ),
                    Divider(
                      color: Colors.black,
                    )
                  ],
                )),
            BottomNavigationBar(
              backgroundColor: Colors.white70,
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
              selectedItemColor: colors[0],
              currentIndex: _currentIndex,
              onTap: onTabTapped,

              // keep the same bottom navigation bar code
            ),
          ],
        ),
      ),
    );
  }
}

/* class HomePage extends StatelessWidget {
  bool value = false;
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
            const Text(
              'Are You Down?',
            ),
            Text(
              '$value',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SwitchButton(value: value,
            onChanged: (value) => setState()
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
} */
