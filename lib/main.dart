import 'package:flutter/material.dart';
import 'utils.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

/// Função que roda a home na main, esse widget deve ser stateful já que
/// o estado muda nas páginas de user e homepage.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  HomePage createState() => HomePage(); // Estado da primeira Página (Home Page do aplicativo).
}

// Página Inicial, appbar, menu, user.
class HomePage extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: NavigationDrawerWidget(), // função que chama o drawer estilizado.
      appBar: DefaultAppBar(), // função que chama a appBar estilizada.
    );
  }
}