import 'package:flutter/material.dart';
import 'package:flutter_application_3/Componentes/input.dart';

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcState();
}

TextEditingController pesoController = TextEditingController();
TextEditingController alturaController = TextEditingController();

double resultado = 0;

String imc = "";

class _ImcState extends State<Imc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora de IMC"),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  InputCampo(
                    label: "Altura",
                    controller: alturaController,
                    obscureText: false,
                    validator: (value) =>
                        value!.isEmpty ? "Ingrese la Altura" : null,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  InputCampo(
                    label: "Peso",
                    controller: pesoController,
                    obscureText: false,
                    validator: (value) =>
                        value!.isEmpty ? "Ingrese el Peso" : null,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        resultado = (double.parse(pesoController.text) /
                            (double.parse(alturaController.text) *
                                double.parse(alturaController.text)));
                      });
                      if (resultado < 18.6){
                        imc = "Peso inferior al normal";
                      }else if(resultado >= 18.5 && resultado <= 24.9){
                        imc = "Normal";
                      }else if(resultado >= 25.0 && resultado <= 29.9){
                        imc = "Peso superior al normal";
                      }else{
                        imc = "Obesidad";
                      }
                    },
                    child: const Text('Calcular IMC'),
                  ),
                  const SizedBox(height: 10),
                  Text("Su IMC es: $resultado y su Composición Corporal es: $imc"),
                ],
              ),
            ),
          ),
        )));
  }
}
