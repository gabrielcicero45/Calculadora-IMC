import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
  String _infoText = "Informe seus dados";
  void _resetFiedls() {
    peso.text = "";
    altura.text = "";
    setState(() {
      _infoText = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void calcula() {
    setState(() {
      double peso1 = double.parse(peso.text);
      double altura1 = double.parse(altura.text) / 100;
      double imc = peso1 / (altura1 * altura1);
      if (imc < 18.6) {
        _infoText = "Abaixo do Peso ${imc.toStringAsPrecision(3)}";
      } else if (imc < 24.9) {
        _infoText = "Peso Ideal ${imc.toStringAsPrecision(3)}";
      } else if (imc < 24.9) {
        _infoText = "Peso Ideal ${imc.toStringAsPrecision(3)}";
      } else if (imc < 29.9) {
        _infoText = "Sobrepeso ${imc.toStringAsPrecision(3)}";
      } else if (imc < 34.9) {
        _infoText = "Obesidade I ${imc.toStringAsPrecision(3)}";
      } else if (imc < 39.9) {
        _infoText = "Obesidade II ${imc.toStringAsPrecision(3)}";
      } else {
        _infoText = "Obesidade III ${imc.toStringAsPrecision(3)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFiedls,
          ),
        ],
      ),
      backgroundColor: Colors.white12,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Icon(
                Icons.person_outline,
                size: 80,
                color: Colors.cyan,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso(kg)",
                    labelStyle: TextStyle(color: Colors.cyan, fontSize: 20)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.cyan, fontSize: 25),
                controller: peso,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira seu peso !";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura(cm)",
                    labelStyle: TextStyle(color: Colors.cyan, fontSize: 20)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.cyan, fontSize: 25),
                controller: altura,
                validator: (value) {
                  if (value.isEmpty){
                    return "Insira sua Altura !";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                child: Container(
                  height: 45,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                          calcula();
                      }
                    },
                    child: Text("Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                    color: Colors.cyan,
                  ),
                ),
              ),
              Text(_infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.cyanAccent, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
