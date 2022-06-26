// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class despesas extends StatefulWidget {
  const despesas({Key? key}) : super(key: key);

  @override
  Despesas createState() => Despesas();
}

class Despesas extends State<despesas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas"),
      ),
      body: Container(
        width: double.infinity,
      ),
    );
  }
}