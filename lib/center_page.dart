import 'package:flutter/material.dart';

class CenterScreen extends StatefulWidget {
  const CenterScreen({Key? key}) : super(key: key);

  @override
  _CenterScreen createState() => _CenterScreen();
}

class _CenterScreen extends State<CenterScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'pagina 0',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}