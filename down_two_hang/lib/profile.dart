import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Profile'),
      ),
      
      body: Center(
          child: SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            children: const [
            // CircleAvatar(
            //   backgroundImage: AssetImage(),
            //   )
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: 40,
                width: 40,
              )
            )  
            ]
            )
          )
        
      ),
    );
  }
}

