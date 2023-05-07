import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'login.dart';
import 'homepage.dart';
import 'color_palette.dart';
import 'util.dart';
import 'app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String title = 'Down2Hang';

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: title,
    theme: AppTheme.appTheme(),
    // home: MyHomePage(title: title), // original line
    home: LoginPage(), // test line
  );
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool value = false;
  final currentUser = FirebaseAuth.instance.currentUser;
  final firestoreRef = FirebaseFirestore.instance.collection('users');

  //function changes the status of the 'isOnline' variable
  void updateUserOnlineStatus(bool isOnline) async {
    await firestoreRef.doc(currentUser?.uid).update({'isOnline': isOnline});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Are You Down?',
            ),
            Text(
              '$value',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            buildSwitch(),
          ],
        ),
      ),
    );
  }

  Widget buildSwitch() => Transform.scale(
        scale: 2,
        child: Switch.adaptive(
            activeColor: Color.fromARGB(255, 123, 32, 139),
            activeTrackColor: Color.fromARGB(255, 227, 124, 246),
            inactiveThumbColor: Color.fromARGB(255, 227, 124, 246),
            inactiveTrackColor: Color.fromARGB(255, 236, 195, 244),
            value: value,
            onChanged: (value) => setState(() {
                  this.value = value;
                  updateUserOnlineStatus(value);
                })),
      );
}
