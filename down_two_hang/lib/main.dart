import 'package:down_two_hang/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'login.dart';
import 'homepage.dart';
import 'color_palette.dart';
import 'util.dart';
import 'profile.dart';
import 'app_theme.dart';
import "signup_page.dart";

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
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      '/signup': (context) => SignupPage(),
      '/home': (context) => HomePage(),
    },
  );
}

