import 'package:flutter/material.dart';

class ResultadosPage extends StatelessWidget {
  final List<Text> resultados;

  ResultadosPage({@required this.resultados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultados"),
      ),
      body: Column(
        children: resultados,
      ),
    );
  }
}
