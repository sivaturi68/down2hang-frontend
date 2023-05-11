import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final databaseRef = FirebaseFirestore.instance.collection('users');
  final auth = FirebaseAuth.instance;
  User? user;
  String? userName = '';
  String? userID = '';
  String? userEmail = '';
  String userAvatarUrl = '';

  @override
  void initState() {
    super.initState();
    user = auth.currentUser;
    userName = user?.displayName ?? "null user";
    userID = user?.uid ?? "null user";
    userEmail = user?.email ?? "null user";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://i.fbcd.co/products/resized/resized-750-500/l010e-6-e08-mainpreview-1543b1db1c818443c5135ba0c3dd8f3cdb03ffd96d1177c659d823cdb2d7477d.jpg'),
            ),
            const SizedBox(height: 10),
            Text(
              '$userName',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '$userID',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '$userEmail',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
