import 'package:flutter/material.dart';

class LeftScreen extends StatefulWidget {
  const LeftScreen({Key? key}) : super(key: key);

  @override
  _LeftScreen createState() => _LeftScreen();
}

class _LeftScreen extends State<LeftScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'pagina -1',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}