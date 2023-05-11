import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Friend {
  final String name;
  final String email;

  Friend({required this.name, required this.email});

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      name: json['name'],
      email: json['email'],
    );
  }
}

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  late List<Friend> friends;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadFriends();
  }

  Future<void> loadFriends() async {
    friends = await getFriends();
    setState(() {
      isLoading = false;
    });
  }

  Future<List<Friend>> getFriends() async {
    final contents = await rootBundle.loadString('assets/friends.json');
    final List<dynamic> list = json.decode(contents);
    return list.map((e) => Friend.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: friends.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(friends[index].name),
                    subtitle: Text(friends[index].email),
                  ),
                );
              },
            ),
    );
  }
}
