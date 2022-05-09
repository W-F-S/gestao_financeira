// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class user_screen extends StatefulWidget {
  const user_screen({Key? key}) : super(key: key);

  @override
  User_Screen createState() => User_Screen();
}

/// Aqui é o corpo da tela user.
class User_Screen extends State<user_screen> {
  _recuperarBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "database.bd");
    var bd = await openDatabase(
        localBancoDados,
        version: 2,
        onCreate: (db, dbVersaoRecente){
          String sql = "CREATE TABLE IF NOT EXISTS userData (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, email VARCHAR, senha VARCHAR) ";
          db.execute(sql);
        }
    );
    return bd;
    //print("aberto: " + bd.isOpen.toString() );
  }

  _salvarDadosUser(String name, String email, String senha) async {
    Database bd = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario = {
      "name" : name,
      "email" : email,
      "senha": senha
    };
    int id = await bd.insert("userData", dadosUsuario);
    print("Salvo: $id " );
  }

  _listarUsuarios() async{
    Database bd = await _recuperarBancoDados();
    String sql = "SELECT * FROM userData";
    List userData = await bd.rawQuery(sql); //conseguimos escrever a query que quisermos
    for(var usu in userData){
      print(" id: "+usu['id'].toString() +
          " name: "+usu['name']+
          " email: "+usu['email']+
          " senha: "+usu['senha']);
    }
  }

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