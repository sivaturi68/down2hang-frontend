import 'package:flutter/material.dart';
import 'login.dart';
import 'homepage.dart';

class UserStatusMessage extends StatelessWidget {
  final String status;

  const UserStatusMessage ({required this.status});

  @override
  Widget build(BuildContext context) {
    /* if user status is online, prompt for user status */ 
    if (status == 'Online') {
      return Column(
        children: [
          const Text(
            'Online',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement status message prompt
            },
            child: const Text('Set Status'),
          ),
        ],
      );
    } else {
      /* otherwise don't prompt */
      return const SizedBox.shrink();
    }
  }
}
