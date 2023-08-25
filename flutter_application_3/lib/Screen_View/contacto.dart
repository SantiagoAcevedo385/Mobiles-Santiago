import 'package:flutter/material.dart';
import 'package:flutter_application_3/Componentes/input.dart';

class Contacto extends StatefulWidget {
  const Contacto({super.key});

  @override
  State<Contacto> createState() => _ContactoState();
}

TextEditingController correoController = TextEditingController();
TextEditingController nombreController = TextEditingController();
TextEditingController telefonoController = TextEditingController();


String resultado = "";


class _ContactoState extends State<Contacto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Formulario para Contactarse con nosotros"),
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
                    label: "Correo Eléctronico: ",
                    controller: correoController,
                    obscureText: false,
                    validator: (value) =>
                        value!.isEmpty ? "Ingrese su correo eléctronico" : null,
                    keyboardType: TextInputType.number,
                  ),
                   const SizedBox(height: 10),
                  InputCampo(
                    label: "Nombre: ",
                    controller: nombreController,
                    obscureText: false,
                    validator: (value) =>
                        value!.isEmpty ? "Ingrese su nombre" : null,
                    keyboardType: TextInputType.number,
                  ),
                   const SizedBox(height: 10),
                  InputCampo(
                    label: "Teléfono: ",
                    controller: telefonoController,
                    obscureText: false,
                    validator: (value) =>
                        value!.isEmpty ? "Ingrese su teléfono" : null,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        resultado = "Gracias por Contactarte con nosotros";
                      });
                    },
                    child: const Text('Contactarse'),
                  ),
                  const SizedBox(height: 10),
                  Text(resultado),
                ],
              ),
            ),
          ),
        )));
  }
}
