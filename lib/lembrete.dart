import 'package:flutter/material.dart';

class lembrete extends StatefulWidget {
  const lembrete({Key? key}) : super(key: key);

  @override
  Lembrete createState() => Lembrete();
}

class Lembrete extends State<lembrete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
      ),
    );
  }
}