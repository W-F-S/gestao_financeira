import 'package:flutter/material.dart';

Widget receitaWidget(String x, String y, String z) {
  return Container (
    height: 80,
    margin: const EdgeInsets.only(top:5, left: 8, right: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.blueAccent,
    ),
  );
}

Widget nullReceitaWidget() {
  return Container (
    height: 80,
    margin: const EdgeInsets.only(top:5, left: 8, right: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.orange,
    ),
  );
}