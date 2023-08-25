import 'package:flutter/material.dart';
import 'package:flutter_application_3/Componentes/input.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});
  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  String _selectedProduct = 'Café Amargo';
  String _selectedProductImage ='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKYco91xrPacMsmdCL9y50K8iMz8eCQPA_oxIaRgzPOs65d8gawvgEmeh67vM40OtmSdw&usqp=CAU';




 final List<Map<String, dynamic>> _productosData = [
  {
    'nombre': 'Café Amargo',
    'imagen': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKYco91xrPacMsmdCL9y50K8iMz8eCQPA_oxIaRgzPOs65d8gawvgEmeh67vM40OtmSdw&usqp=CAU'
  },
  {
    'nombre': 'Café Tostado',
    'imagen': 'https://1.bp.blogspot.com/-3tnIdy608dM/XW2IHmSpV4I/AAAAAAAARRM/WHoNo1ih3OYaIbpZInAaqJTu0KHkHNYTQCLcBGAs/s1600/Gatitos%2Belegantes%2Bcon%2Bcorbata%2B13.jpg'
  },
  {
    'nombre': 'Café Oscuro',
    'imagen': 'https://th.bing.com/th/id/OIP.B7m4BfPbSL4SwFHIRmvFgQHaHa?pid=ImgDet&w=500&h=500&rs=1'
  }
 ]; 






  TextEditingController cantidadAvesController = TextEditingController();
  TextEditingController cantidadConcentradoController = TextEditingController();
  TextEditingController cantidadBultosController = TextEditingController();

  double resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Cotización')),
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
              value: _productosData.firstWhere((product)=> product['nombre'] == _selectedProduct),
              onChanged: (newValue) {
                setState(() {
                  _selectedProduct = newValue!
                  ['nombre'];
                  _selectedProductImage = newValue['imagen'];
                });
              },
              items: _productosData.map<DropdownMenuItem<Map<String, dynamic>>>((Map<String, dynamic> product) {
                return DropdownMenuItem<Map<String, dynamic>>(
                  value: product,
                  child: Text(product['nombre']),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: 'Producto'),
            ),
            const SizedBox(height: 10),
            Image.network(
              _selectedProductImage,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 10),
            InputCampo(
                label: "Valor Unitario: ",
                controller: cantidadConcentradoController,
                obscureText: false,
                validator: (value) => value!.isEmpty
                    ? "Ingrese el Valor Unitario"
                    : null,
                keyboardType: TextInputType.number),
            const SizedBox(height: 10),
            InputCampo(
                label: "Cantidad: ",
                controller: cantidadBultosController,
                obscureText: false,
                validator: (value) => value!.isEmpty
                    ? "Ingrese la Cantidad de Productos valida"
                    : null,
                keyboardType: TextInputType.number),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  resultado = (double.parse(cantidadBultosController.text) *
              
                          double.parse(cantidadConcentradoController.text));
                });
              },
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 10),
            Text("Valor Total: $resultado"),
          ],
        ),
      )))),
    );
  }
}
