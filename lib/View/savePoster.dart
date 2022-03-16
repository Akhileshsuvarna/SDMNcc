import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class addPost extends StatefulWidget {
  const addPost({Key? key}) : super(key: key);

  @override
  _addPostState createState() => _addPostState();
}

class _addPostState extends State<addPost> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ const SizedBox(
          height: 20,
        ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Setting'),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}