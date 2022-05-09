import 'package:flutter/material.dart';
import 'center_page.dart';
import 'left_page.dart';
import 'right_page.dart';
import 'utils.dart';
import 'botao_flutuante.dart';
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
  HomePage createState() =>
      HomePage(); // Estado da primeira Página (Home Page do aplicativo).
}

// Página Inicial, appbar, menu, user, bottombar.
class HomePage extends State<MyApp> {
  int bottomSelectedIndex = 1;

  PageController pageController = PageController(initialPage: 1);

  // Muda o Index de Bottom assim que a viewpage também muda.
  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  // Muda o state da pagina quando bottomtab é apertada.
  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      // Quando pagina mudar, mudar o indice de bottom também.
      onPageChanged: (index) {
        pageChanged(index);
      },
     children: const <Widget>[
        LeftScreen(),
        CenterScreen(),
        RightScreen(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(), // função que chama o drawer estilizado.
      appBar: const DefaultAppBar(), // função que chama a appBar estilizada.
      body: buildPageView(), // função que retorna o pageview e as páginas listadas
      floatingActionButton: ExampleExpandableFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: defaultBottomAppBar(),
      ),
    );
  }
}
