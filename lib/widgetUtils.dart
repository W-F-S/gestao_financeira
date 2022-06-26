import 'package:flutter/material.dart';

Widget receitaWidget(String x, String y, String z) {
  return Text("Receita: $x\n"
              "BancoId: $y\n"
              "Value (receita != 0 / despesa == 0): $z\n");
}