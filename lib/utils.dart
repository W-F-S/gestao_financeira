import 'package:flutter/material.dart';
import 'user_screen.dart';

/// Função que estiliza o Drawer do menu principal,
/// Estilizar cores e adicionar funcionalidades posteriormente.
class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.access_time_filled_sharp),
          title: Text('Funcionalidade 1'),
        ),
        ListTile(
          leading: Icon(Icons.access_time_filled_sharp),
          title: Text('Funcionalidade 2'),
        ),
        ListTile(
          leading: Icon(Icons.access_time_filled_sharp),
          title: Text('Funcionalidade 3'),
        ),
      ],
    ));
  }
}

/// Função que estilizar a AppBar principal do aplicativo.
/// Rever palheta de cores no futuro.
class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu_rounded),
          iconSize: 30,
          color: Colors.black,
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const user_screen()));
          },
          icon: const Icon(Icons.account_circle_sharp),
          color: Colors.black,
          iconSize: 30,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
