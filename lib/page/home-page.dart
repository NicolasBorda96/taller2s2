import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String operaciones = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Container(
          color: Colors.blue,
          height: 100,
        ),
        Container(
          color: Colors.yellow,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("7")),
                  ElevatedButton(onPressed: () {}, child: Text("8")),
                  ElevatedButton(onPressed: () {}, child: Text("9")),
                  ElevatedButton(onPressed: () {}, child: Text("/")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("4")),
                  ElevatedButton(onPressed: () {}, child: Text("5")),
                  ElevatedButton(onPressed: () {}, child: Text("6")),
                  ElevatedButton(onPressed: () {}, child: Text("*")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("1")),
                  ElevatedButton(onPressed: () {}, child: Text("2")),
                  ElevatedButton(onPressed: () {}, child: Text("3")),
                  ElevatedButton(onPressed: () {}, child: Text("-")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("0")),
                  ElevatedButton(onPressed: () {}, child: Text("C")),
                  ElevatedButton(onPressed: () {}, child: Text("=")),
                  ElevatedButton(onPressed: () {}, child: Text("+")),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
