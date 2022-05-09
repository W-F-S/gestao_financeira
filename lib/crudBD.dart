import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

/// Metodo para criar o banco de dados e três tabelas.
/// Tabela usuario -> nome, email e senha.
/// Tabela bancos -> nome, id usuario.
/// Tabela transações -> valor das transações, id usuario, id banco e tipo.
recuperarBancoDados() async {
  final caminhoBancoDados = await getDatabasesPath();
  final localBancoDados = join(caminhoBancoDados, "database.bd");
  var bd = await openDatabase(
      localBancoDados,
      version: 2,
      onCreate: (db, dbVersaoRecente){

        db.execute("CREATE TABLE IF NOT EXISTS userData (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, email VARCHAR, senha VARCHAR); ");
        db.execute("CREATE TABLE IF NOT EXISTS cadBancos (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, userId INTEGER NOT NULL,  FOREIGN KEY(userId) REFERENCES userData(id)); ");
        db.execute("CREATE TABLE IF NOT EXISTS transacoes (id INTEGER PRIMARY KEY AUTOINCREMENT, value INTEGER NOT NULL, userId INTEGER NOT NULL, bancoId INTEGER NOT NULL, type VARCHAR, FOREIGN KEY(userId) REFERENCES userData(id), FOREIGN KEY(bancoId) REFERENCES cadBancos(id)); ");

      }
  );
  return bd;
}

/// Salvar um usuario no banco de dados.
salvarDadosUser(String name, String email, String senha) async {
  Database bd = await recuperarBancoDados();
  Map<String, dynamic> dadosUsuario = {
    "name" : name,
    "email" : email,
    "senha": senha
  };
  bd.insert("userData", dadosUsuario);
}

/// Salvar uma transação feita pelo usuario no banco de dados.
salvarDadosTransacao(int value, int userId, int bancoId, String type, bool despesa) async {
  Database bd = await recuperarBancoDados();
  if(despesa) value *= -1;
  Map<String, dynamic> dadosTransacao = {
    "value" : value,
    "userId" : userId,
    "bancoId" : bancoId,
    "type": type
  };
  bd.insert("userData", dadosTransacao);
}

/// Listar usuarios presentes no sistema *metodo apenas para testes*
listarUsuarios() async{
  Database bd = await recuperarBancoDados();
  List userData = await bd.rawQuery("SELECT * FROM userData"); //conseguimos escrever a query que quisermos
  for(var usu in userData){
    print(" id: "+usu['id'].toString() +
        " name: "+usu['name']+
        " email: "+usu['email']+
        " senha: "+usu['senha']);
  }
}

/// Listar bancos presentes no sistema *metodo apenas para testes*
listarBancos() async{
  Database bd = await recuperarBancoDados();
  List userData = await bd.rawQuery("SELECT * FROM cadBancos"); //conseguimos escrever a query que quisermos
  for(var usu in userData){
    print(" id: "+usu['id'].toString() +
        " name: "+usu['name']+
        " userId: "+usu['userId'].toString());
  }
}

/// Listar transações feitas no sistema *metodo apenas para testes*
listarTransacoes() async{
  Database bd = await recuperarBancoDados();
  List userData = await bd.rawQuery("SELECT * FROM transacoes"); //conseguimos escrever a query que quisermos
  for(var usu in userData){
    print(" id: "+usu['id'].toString() +
        " value: "+usu['value'].toString()+
        " userId: "+usu['userId'].toString()+
        " bancoId: "+usu['bancoId'].toString()+
        " type: "+usu['type']);
  }
}

// Metodo para recuperar a receita de um banco de determinado usuario
Future<int> receitaUsuarioBanco(int userId, int bancoId) async{
  Database bd = await recuperarBancoDados();
  List receita = await bd.rawQuery("SELECT SUM(value) FROM transacoes WHERE type='0' AND userId="+userId.toString()+"AND bancoId="+bancoId.toString()+";");
  //não sei se o valor userId.toString transforma o 0 para um '0' ou "0", então caso der error tentar conserta ou checar essa possibilidade

  return receita[0]['SUM(value)'];
  //coloquei o valor SUM(value) porque na criação da lista ele é o parametro mais provavel, se não der certo tenta com '0'
}

/// Metodo para recuperar a receita total do usuario (em todos bancos e receita sem banco).
Future<int> receitaUsuario(int userId) async{
  Database bd = await recuperarBancoDados();
  List receita = await bd.rawQuery("SELECT SUM(value) FROM transacoes WHERE type='0' AND userId="+userId.toString()+";");
  //não sei se o valor userId.toString transforma o 0 para um '0' ou "0", então caso der error tentar conserta ou checar essa possibilidade

  return receita[0]['SUM(value)'];
  //coloquei o valor SUM(value) porque na criação da lista ele é o parametro mais provavel, se não der certo tenta com '0'
}

/// Metodo para recuperar despesas do usuario para um determinado banco
Future<int> despesaUsuarioBanco(int userId, int bancoId) async{
  Database bd = await recuperarBancoDados();
  List receita = await bd.rawQuery("SELECT SUM(value) FROM transacoes WHERE type!='0' AND userId="+userId.toString()+"AND bancoId="+bancoId.toString()+";");
  //não sei se o valor userId.toString transforma o 0 para um '0' ou "0", então caso der error tentar conserta ou checar essa possibilidade

  return receita[0]['SUM(value)'];
  //coloquei o valor SUM(value) porque na criação da lista ele é o parametro mais provavel, se não der certo tenta com '0'
}

/// Metodo para recuperar todas as despesas do usuario, inclusive as foras de banco.
Future<int> despesaUsuario(int userId) async{
  Database bd = await recuperarBancoDados();
  List receita = await bd.rawQuery("SELECT SUM(value) FROM transacoes WHERE type!='0' AND userId="+userId.toString()+";");
  //não sei se o valor userId.toString transforma o 0 para um '0' ou "0", então caso der error tentar conserta ou checar essa possibilidade

  return receita[0]['SUM(value)'];
  //coloquei o valor SUM(value) porque na criação da lista ele é o parametro mais provavel, se não der certo tenta com '0'
}

/// Metodo para saber se o usuario digitou suas informações de login corretamente.
Future<int> login(String email, String senha) async{
  Database bd = await recuperarBancoDados();

  List user = await bd.rawQuery("SELECT id FROM userData WHERE email="+email+" AND senha="+senha+";");

  if(user.isEmpty) return 0;

  return user[0]['id'];
}