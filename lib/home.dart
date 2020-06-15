import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();

  String resultado = "Seja bem vindo ao teste de IMC";

  void calcularIMC() {
    double peso = double.tryParse(controllerPeso.text);
    double altura = double.tryParse(controllerAltura.text);

    double razao = peso / (altura * altura);

    if (razao <= 18.5) {
      setState(() {
        resultado = "O resultado do seu IMC é: Baixo peso";
      });
    } else if (razao <= 25) {
      setState(() {
        resultado = "O resultado do seu IMC é: Peso adequeado";
      });
    } else if (razao <= 30) {
      setState(() {
        resultado = "O resultado do seu IMC é: Sobrepeso";
      });
    } else if (razao <= 35) {
      setState(() {
        resultado = "O resultado do seu IMC é: Obesidade Leve";
      });
    } else {
      setState(() {
        resultado = "O resultado do seu IMC é: Obesidade";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculo IMC"),
          centerTitle: true,
        ),
        body: Container(
            child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: Image.asset(
                              'images/healthcare.png',
                              width: 100,
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                              top: 16,
                              bottom: 16,
                            ),
                            child: Text(
                              resultado,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(labelText: "Peso (ex: 75.2):"),
                            controller: controllerPeso,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Altura (ex: 1.75):"),
                            controller: controllerAltura,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                                onPressed: calcularIMC,
                                child: Text('Calcular',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                color: Colors.deepPurple,
                                padding: EdgeInsets.all(10),
                              ),
                            ))
                      ],
                    )))));
  }
}
