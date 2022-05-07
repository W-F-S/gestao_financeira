// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

/// Função referente ao estado da segunda página.
class user_screen extends StatefulWidget {
  const user_screen({Key? key}) : super(key: key);

  @override
  User_Screen createState() => User_Screen();
}

/// Aqui é o corpo da tela user.
class User_Screen extends State<user_screen> {
  _recuperarBancoDados() async{
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco3.bd");
    var bd = await openDatabase(
        localBancoDados,
        version: 1,
        onCreate: (db, dbVersaoRecente){
          String sql = '''CREATE TABLE IF NOT EXISTS DADOS_USER (Id INTEGER PRIMARY KEY AUTOINCREMENT, Nome, Email, Senha)
                          CREATE TABLE  IF NOT EXISTS CAD_BANCOS (Id INTEGER PRIMARY KEY AUTOINCREMENT, Nome_banco, User_Id)                                  CREATE TABLE  IF NOT EXISTS TRANSACOES (Id INTEGER PRIMARY KEY AUTOINCREMENT, Valor, User_id, Banco_id)''';
          db.execute(sql);
        }
    );
    print("aberto: " + bd.isOpen.toString() );
    return bd;
    
  }
  
  void _salvarDadosUser(String nome, String email, String senha) async {
    int id2 =0;
    Database bd = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario = {
      "Id"   : id2,
      "Nome" : nome,
      "Email" : email,
      "Senha" : senha
    };
    int id = await bd.insert("DADOS_USER", dadosUsuario);
    print("Salvo: $id " );
  }

/**  void _salvarDadosBancos(String nome, int Id) async {
    Database bd = await _recuperarBancoDados();
    Map<String, dynamic> dadosBancos = {
      "Nome_banco" : nome,
      "User_id" : Id
    };
    int id = await bd.insert("CAD_BANCOS", dadosUsuario);
    print("Salvo: $id " );
  }*/
  


  _listarUsuarios() async{
    Database bd = await _recuperarBancoDados();
    String sql = "SELECT * FROM DADOS_USER";
    //String sql = "SELECT * FROM usuarios WHERE idade=58";
    //String sql = "SELECT * FROM usuarios WHERE idade >=30 AND idade <=58";
    //String sql = "SELECT * FROM usuarios WHERE idade BETWEEN 18 AND 58";
    //String sql = "SELECT * FROM usuarios WHERE nome='Maria Silva'";
    List usuarios = await bd.rawQuery(sql); //conseguimos escrever a query que quisermos
    for(var usu in usuarios){
      print(" id: "+usu['id'].toString() +
          " nome: "+usu['Nome']+
          " email: "+usu['Email']+
          " senha: "+usu['Senha']);
    }
  }





  @override
  Widget build(BuildContext context) {
    TextEditingController _controllernome = TextEditingController();
    TextEditingController _controllersenha = TextEditingController();
    TextEditingController _controlleremail = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Banco de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Digite o nome: ",
              ),
              controller: _controllernome,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Digite a email: ",
              ),
              controller: _controlleremail,
            ), 
            TextField(
              decoration: InputDecoration(
                labelText: "Digite a senha: ",
              ),
              controller: _controllersenha,
            ),
            SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    child: Text("Salvar um usuário"),
                    onPressed: (){
                      _salvarDadosUser(_controllernome.text, _controlleremail.text, _controllersenha.text);
                    }
                ),
                ElevatedButton(
                    child: Text("Listar todos usuários"),
                    onPressed: (){
                      _listarUsuarios();
                    }
                ),
                ElevatedButton(
                    child: Text("Listar um usuário"),
                    onPressed: (){
      //                _listarUmUsuario(2);
                    }
                ),
                ElevatedButton(
                    child: Text("Atualizar um usuário"),
                    onPressed: (){
    //                  _atualizarUsuario(2);
                    }
                ),
                ElevatedButton(
                    child: Text("Excluir usuário"),
                    onPressed: (){
   //                   _excluirUsuario();
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
