import 'package:flutter/material.dart';
import 'package:flutter_application_3/Componentes/input.dart';

class Calorias extends StatefulWidget {
  const Calorias({super.key});
  @override
  State<Calorias> createState() => _CaloriasState();
}

class _CaloriasState extends State<Calorias> {
  String _selectedProduct = 'Mujer';
  String _selectedProductImage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKYco91xrPacMsmdCL9y50K8iMz8eCQPA_oxIaRgzPOs65d8gawvgEmeh67vM40OtmSdw&usqp=CAU';

  final List<Map<String, dynamic>> _productosData = [
    {
      'nombre': 'Mujer',
      'imagen':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKYco91xrPacMsmdCL9y50K8iMz8eCQPA_oxIaRgzPOs65d8gawvgEmeh67vM40OtmSdw&usqp=CAU'
    },
    {
      'nombre': 'Hombre',
      'imagen':
          'https://1.bp.blogspot.com/-3tnIdy608dM/XW2IHmSpV4I/AAAAAAAARRM/WHoNo1ih3OYaIbpZInAaqJTu0KHkHNYTQCLcBGAs/s1600/Gatitos%2Belegantes%2Bcon%2Bcorbata%2B13.jpg'
    },
  ];

  TextEditingController caloriasDController = TextEditingController();
  TextEditingController caloriasAController = TextEditingController();
  TextEditingController caloriasCController = TextEditingController();

  double resultado = 0;

  String genero = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Calculadora de Calorías Diarias')),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Form(
                  child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            DropdownButtonFormField<Map<String, dynamic>>(
              value: _productosData.firstWhere(
                  (product) => product['nombre'] == _selectedProduct),
              onChanged: (newValue) {
                setState(() {
                  _selectedProduct = newValue!['nombre'];
                  _selectedProductImage = newValue['imagen'];
                });
              },
              items: _productosData.map<DropdownMenuItem<Map<String, dynamic>>>(
                  (Map<String, dynamic> product) {
                return DropdownMenuItem<Map<String, dynamic>>(
                  value: product,
                  child: Text(product['nombre']),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: 'Genéro'),
            ),
            const SizedBox(height: 10),
            Image.network(
              _selectedProductImage,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 10),
            InputCampo(
                label: "Calorias del Desayuno: ",
                controller: caloriasDController,
                obscureText: false,
                validator: (value) =>
                    value!.isEmpty ? "Ingrese la calorias del desayuono" : null,
                keyboardType: TextInputType.number),
            const SizedBox(height: 10),
            InputCampo(
                label: "Calorias del Almuerzo: ",
                controller: caloriasAController,
                obscureText: false,
                validator: (value) =>
                    value!.isEmpty ? "Ingrese las calorias del almuerzo" : null,
                keyboardType: TextInputType.number),
            const SizedBox(height: 10),
            InputCampo(
                label: "Calorias de la Cena: ",
                controller: caloriasCController,
                obscureText: false,
                validator: (value) =>
                    value!.isEmpty ? "Ingrese las calorias de la cena" : null,
                keyboardType: TextInputType.number),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  resultado = (double.parse(caloriasDController.text) +
                      double.parse(caloriasAController.text) +
                      double.parse(caloriasCController.text));
                });
                if(_selectedProduct == "Mujer" && resultado < 1600){
                  genero = "Su consumo es inferior a 1600 por lo tanto tiene Déficit Calórico";
                }else if(_selectedProduct == "Mujer" && resultado >= 1600 && resultado <= 2000){
                  genero = "Su consumo esta entre 1600 y 2000 por lo tanto tiene Consumo normal de calorías";
                }else if(_selectedProduct == "Mujer" && resultado > 2000){
                  genero = "Su consumo es mayor a 2000 por lo tanto tiene Consumo Excesivo de calorías";
                }else if(_selectedProduct == "Hombre" && resultado < 1600){
                  genero = "Su consumo es inferior a 1600 por lo tanto tiene Déficit Calórico";
                }else if(_selectedProduct == "Hombre" && resultado >= 2000 && resultado <= 2500){
                  genero = "Su consumo esta entre 2000 y 2500 por lo tanto tiene Consumo normal de calorías";
                }else if(_selectedProduct == "Hombre" && resultado > 2500){
                  genero = "Su consumo es mayor a 2500 por lo tanto tiene Consumo Excesivo de calorías";
                }

              },
              child: const Text('Calcular calorías'),
            ),
            const SizedBox(height: 10),
            Text("Su genero es: $_selectedProduct y su consumo total de calorías es: $resultado por lo tanto: $genero"),
          ],
        ),
      )))),
    );
  }
}
