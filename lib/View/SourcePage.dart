import 'package:flutter/material.dart';

class SourcePage extends StatefulWidget {
  const SourcePage({Key? key}) : super(key: key);

  @override
  _SourcePageState createState() => _SourcePageState();
}

class _SourcePageState extends State<SourcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Source Page'),),
    );
  }
}
