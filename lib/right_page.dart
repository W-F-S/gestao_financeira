import 'package:flutter/material.dart';

class RightScreen extends StatefulWidget {
  const RightScreen({Key? key}) : super(key: key);

  @override
  _RightScreen createState() => _RightScreen();
}

class _RightScreen extends State<RightScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'pagina 1',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
