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
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  
  GlobalKey<FormState> _chave = GlobalKey<FormState>();

  String _info = "Informe os seus dados";

  void _reset() {
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
           _info = "Informe seus dados";
        });
  }

  void _calcular() {
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text) / 100;

    double imc =  peso / (altura * altura);
    
    setState(() {
          if (imc < 18.5) {​​​​​
_info = "Abaixo do peso (${​​​​​imc.toStringAsPrecision(3)}​​​​​)";
}​​​​​ else if (imc >= 18.5 && imc <= 24.9) {​​​​​
_info = "Peso normal(${​​​​​imc.toStringAsPrecision(3)}​​​​​)";
}​​​​​ else if (imc >= 25.0 && imc <= 29.9) {​​​​​
_info = "Sobrepeso(${​​​​​imc.toStringAsPrecision(3)}​​​​​)";
}​​​​​ else if (imc >= 30.0 && imc <= 34.9) {​​​​​
_info = "Obesidade grau 1 (${​​​​​imc.toStringAsPrecision(3)}​​​​​)";
}​​​​​ else {​​​​​
_info = "Obesidade grau 2 (${​​​​​imc.toStringAsPrecision(3)}​​​​​)";
}​​​​​
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _reset,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
       padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
         child: Form(
           key: _chave,
         child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 100.0,
                color: Colors.purple,
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso(kg)",
                      labelStyle: TextStyle(color: Colors.black38)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.purple, fontSize: 25.0),
                  controller: pesoController),
                  validator: (value){
                      if(value.isEmpty){
                        return "Insira seu peso";
                      }
                  },
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura(cm)",
                      labelStyle: TextStyle(color: Colors.black38)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.purple, fontSize: 25.0),
                  controller: alturaController,
                  validator: (value){
                      if(value.isEmpty){
                        return "Insira sua altura";
                      }
                  },
                  ),
                  
              Container(
                margin:
                    EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                height: 60.0,
                child: ElevatedButton(
                  onPressed: _calcular,
                  child: Text("Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  // color: Colors.purple,
                ),
              ),
              Text(
                _info,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 28.0))
            ]),
      ),
      ),
    );
  }
}
