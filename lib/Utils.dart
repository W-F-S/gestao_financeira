import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget{
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Drawer(
        child: Container(
            color: const Color.fromRGBO(50, 75, 205, 1),
            child: ListView(
                children: [
                  ListTile(
                    title: const Text('Item1'),
                    leading: const Icon(Icons.people),
                    onTap: () {},
                  ),
                  const SizedBox(height: 48)
                ]
            )
        )
    );
  }
}