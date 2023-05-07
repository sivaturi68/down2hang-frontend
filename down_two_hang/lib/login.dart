import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

import './components/login_text_field.dart';
import 'color_palette.dart';

final databaseRef = FirebaseFirestore.instance.collection('users');

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  /* ----------------- controllers for login text input fields ---------------- */
  final usernameController = TextEditingController(
    // TODO: implement
  );
  final passwordController = TextEditingController(
    // TODO: implement
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50), // 50 px of padding

              /* Icon */
              const SvgPicture(
                AssetBytesLoader('lib/icons/appIcon.svg.vec'),
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 50), // 50 px of padding

              /* welcome message */
              Center(
                child: Text(
                  'Welcome to Down2Hang!',
                  style: TextStyle(
                    // color: Colors.white,
                    color: colors[3],
                    fontSize: 20
                  ),
                ),
              ),
              const SizedBox(height: 25), // 25 px of padding

              /* username textfield */
              LoginTextField(
                controller: usernameController,
                labelText: 'Username',
                isPassword: false,
              ),
              const SizedBox(height: 10),

              /* password textfield */
              LoginTextField(
                controller: passwordController,
                labelText: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 10),

              /* forgot login info */
              Center(
                child: Text(
                  'Forgot login info?',
                  style: TextStyle(
                    color: colors[3],
                    fontSize: 14
                  ),
                ),
              ),

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