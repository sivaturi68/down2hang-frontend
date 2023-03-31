import 'package:flutter/material.dart';

class UserStatusMessage extends StatelessWidget {
  final String status;

  UserStatusMessage({required this.status});

  @override
  Widget build(BuildContext context) {
    /* if user status is online, prompt for user status */ 
    if (status == 'Online') {
      return Column(
        children: [
          Text(
            'Online',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement status message prompt
            },
            child: Text('Set Status'),
          ),
        ],
      );
    } else {
      /* otherwise don't prompt */
      return SizedBox.shrink();
    }
  }
}
