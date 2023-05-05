import 'package:flutter/material.dart';

class OutputScreen extends StatefulWidget {
  final String? username;
  const OutputScreen({Key? key, this.username}) : super(key: key);

  @override
  State<OutputScreen> createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(widget.username!)],
      ),
    )));
  }
}