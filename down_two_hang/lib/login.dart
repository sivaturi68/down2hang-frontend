import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

final databaseRef = FirebaseFirestore.instance.collection('users');

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              /* Icon */
              SvgPicture(
                AssetBytesLoader('lib/icons/test.svg.vec'),
                height: 150,
                width: 150,
              )
              /* welcome message */
              /* username textfield */
              /* password textfield */
              /* forgot password */
              /* sign in button */
              /* alternative sign in (google, apple, etc). */
              /* register button */
            ]
          )
        )
      )
    );
  }
}

/*
        Column(children: [
            /* logo */
            SvgPicture.asset(
              'lib/icons/test.svg',
              semanticsLabel: 'Test logo, must change',
            ),
            /* welcome message */
            /* username textfield */
            /* password textfield */
            /* forgot password */
            /* signin button */
            /* alternative signin (google, apple, etc). */
            /* register button */
          ]
        )
 */


// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: Text('Login Here!'),
//       ),
//     );
//   }
// }

void createUser(){

}