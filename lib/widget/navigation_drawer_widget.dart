import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget{
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Container(
        color: Color.fromRGBO(50, 75, 205, 1),
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