import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String operaciones = "";
  String avisos = "";
  List<Text> resultados = [];

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: resultados,
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(operaciones),
                  Text(avisos),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: Colors.yellow,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _numeros("7");
                        });
                      },
                      child: Text("7")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _numeros("8");
                        });
                      },
                      child: Text("8")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _numeros("9");
                        });
                      },
                      child: Text("9")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _signos(" / ");
                        });
                      },
                      child: Text("/")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _numeros("4");
                        });
                      },
                      child: Text("4")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _numeros("5");
                        });
                      },
                      child: Text("5")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _numeros("6");
                        });
                      },
                      child: Text("6")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _signos(" x ");
                        });
                      },
                      child: Text("x")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _numeros("1");
                        });
                      },
                      child: Text("1")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _numeros("2");
                        });
                      },
                      child: Text("2")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _numeros("3");
                        });
                      },
                      child: Text("3")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _signos(" - ");
                        });
                      },
                      child: Text("-")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _numeros("0");
                        });
                      },
                      child: Text("0")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones = "";
                        });
                      },
                      child: Text("C")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _signos("");
                          if (avisos == "") {
                            double result = _calcular(operaciones);
                            resultados.add(Text("$operaciones = $result"));
                            operaciones = "$result";
                          }
                        });
                      },
                      child: Text("=")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _signos(" + ");
                        });
                      },
                      child: Text("+")),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  double _calcular(String operacion) {
    print(operacion);
    double result = 0;
    if (operacion.indexOf(" + ") != -1) {
      List<String> terminos = operacion.split(" + ");
      for (String valor in terminos) {
        result += _calcular(valor);
      }
    } else if (operacion.indexOf(" - ") != -1) {
      List<String> terminos = operacion.split(" - ");
      result += _calcular(terminos.elementAt(0));
      for (var i = 1; i < terminos.length; i++) {
        result -= _calcular(terminos.elementAt(i));
      }
    } else if (operacion.indexOf(" / ") != -1) {
      List<String> terminos = operacion.split(" / ");
      result += _calcular(terminos.elementAt(0));
      for (var i = 1; i < terminos.length; i++) {
        result = result / _calcular(terminos.elementAt(i));
      }
    } else if (operacion.indexOf(" x ") != -1) {
      result = 1;
      List<String> terminos = operacion.split(" x ");
      for (String valor in terminos) {
        result *= _calcular(valor);
      }
    } else {
      result = double.parse(operacion);
    }
    return result;
  }

  void _signos(String signo) {
    if (operaciones == "") {
      operaciones = "0";
    } else if (operaciones.endsWith(" + ") ||
        operaciones.endsWith(" - ") ||
        operaciones.endsWith(" x ") ||
        operaciones.endsWith(" / ")) {
      operaciones = operaciones.substring(0, operaciones.length - 3);
    }
    operaciones += signo;
  }

  void _numeros(String numero) {
    if (operaciones.endsWith("0")) {
      operaciones = operaciones.substring(0, operaciones.length - 1);
    }
    if (numero == "0" && operaciones.endsWith(" / ")) {
      avisos = "Error: División por cero";
    } else {
      avisos = "";
    }
    operaciones += numero;
  }
}
