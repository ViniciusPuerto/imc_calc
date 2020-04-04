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
                IconButton(icon: Icon(Icons.refresh), onPressed: () {})
              ],
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.person_outline,
                    size: 150,
                    color: Colors.deepPurple,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso (Kg)",
                        labelStyle: TextStyle(color: Colors.deepPurple)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.deepPurple, fontSize: 25),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Altura (Cm)",
                        labelStyle: TextStyle(color: Colors.deepPurple)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.deepPurple, fontSize: 25),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      height: 40.0,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.deepPurple,
                        child: Text(
                          "Calcular",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  Text("Info",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.deepPurple, fontSize: 25),
                  )
                ],
              ),
            )
        ));
  }
}
