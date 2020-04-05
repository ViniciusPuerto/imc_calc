import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Imc Calculator",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heigthController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Insira suas medidas";

  void _resetFields() {
    weightController.text = "";
    heigthController.text = "";
    setState(() {
      _infoText = "Insira suas medidas";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heigthController.text) / 100;
      double imc = weight / (height * height);
      if(imc < 18.6){
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 18.6 && imc < 24.9){
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 24.9 && imc < 29.9){
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 29.9 && imc < 34.9){
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 34.9 && imc < 39.9){
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 40){
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('IMC Calculator'),
              backgroundColor: Colors.deepPurple,
              centerTitle: true,
              elevation: 10.0,
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      _resetFields();
                    })
              ],
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: <Widget>[
                    Icon(
                      Icons.person_outline,
                      size: 150,
                      color: Colors.deepPurple,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Peso (Kg)",
                          labelStyle: TextStyle(color: Colors.deepPurple)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.deepPurple, fontSize: 25),
                      controller: weightController,
                      validator: (value){
                        if(value.isEmpty){
                          return "Insira sua Peso!";
                        }
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Altura (Cm)",
                          labelStyle: TextStyle(color: Colors.deepPurple)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.deepPurple, fontSize: 25),
                      controller: heigthController,
                      // ignore: missing_return
                      validator: (value){
                        if(value.isEmpty) {
                          return "Insira sua altura";
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        height: 40.0,
                        child: RaisedButton(
                          onPressed: () {
                            if(_formKey.currentState.validate()){
                              _calculate();
                            }
                          },
                          color: Colors.deepPurple,
                          child: Text(
                            "Calcular",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      _infoText,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.deepPurple, fontSize: 25),
                    )
                ],
              )),
            )));
  }
}
