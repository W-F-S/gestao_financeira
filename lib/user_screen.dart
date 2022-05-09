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
    TextEditingController _controllernome = TextEditingController();
    TextEditingController _controlleremail = TextEditingController();
    TextEditingController _controllersenha = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Banco de dados"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: "Digite o nome: ",
              ),
              controller: _controllernome,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Digite o email: ",
              ),
              controller: _controlleremail,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Digite a senha: ",
              ),
              controller: _controllersenha,
            ),
            const SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    child: const Text("Salvar um usuário"),
                    onPressed: (){
                      _salvarDadosUser(_controllernome.text, _controlleremail.text, _controllersenha.text);
                    }
                ),
                ElevatedButton(
                    child: const Text("Listar todos usuários"),
                    onPressed: (){
                      _listarUsuarios();
                    }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
