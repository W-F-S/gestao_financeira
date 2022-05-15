// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'crudBD.dart';

class user_screen extends StatefulWidget {
  const user_screen({Key? key}) : super(key: key);

  @override
  User_Screen createState() => User_Screen();
}

/// Aqui é o corpo da tela user.
class User_Screen extends State<user_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Banco de dados"),
      ),
      body: Container(
        width: double.infinity,
      ),
    );
  }
}