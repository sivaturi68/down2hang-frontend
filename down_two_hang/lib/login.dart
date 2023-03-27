import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

import './components/login_text_field.dart';

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
            children: const [
              SizedBox(height: 50), // 50 px of padding

              /* Icon */
              SvgPicture(
                //? Replace this with our own logo
                AssetBytesLoader('lib/icons/test.svg.vec'),
                height: 150,
                width: 150,
              ),
              SizedBox(height: 50), // 50 px of padding

              /* welcome message */
              Center(
                child: Text(
                  'Welcome to Down2Hang!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
              ),
              SizedBox(height: 25), // 25 px of padding

              /* username textfield */
              LoginTextField(
                labelText: 'Username',
                isPassword: false,
              ),
              SizedBox(height: 10),

              /* password textfield */
              LoginTextField(
                labelText: 'Password',
                isPassword: true,
              ),
              SizedBox(height: 10),

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