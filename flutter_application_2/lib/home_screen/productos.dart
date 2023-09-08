import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Componentes/input.dart';
import 'package:flutter_application_2/models/producto.dart';
import 'package:http/http.dart' as http;

//https://frontendhbs.onrender.com/
Future<Album> createAlbum(String name, String valorU, String insumo,
    String stockMin, String stockMax, String descripcion) async {
  final response = await http.post(
    Uri.parse('https://coff-v-art-api.onrender.com/api/product'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'valorU': valorU,
      'insumo': insumo,
      'stockMin': stockMin,
      'stockMax': stockMax,
      'descripcion': descripcion
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception(response.body);
  }
}

class Album {
  final String id;
  final String name;
  final double valorU;
  final String insumo;
  final int stockMin;
  final int stockMax;
  final String descripcion;

  const Album(
      {required this.id,
      required this.name,
      required this.valorU,
      required this.insumo,
      required this.stockMin,
      required this.stockMax,
      required this.descripcion});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        id: json['id'],
        name: json['name'],
        valorU: json['valorU'],
        insumo: json['insumo'],
        stockMin: json['stockMin'],
        stockMax: json['stockMax'],
        descripcion: json['descripcion']);
  }
}

class CrearProducto extends StatefulWidget {
  const CrearProducto({super.key});

  @override
  State<CrearProducto> createState() {
    return _CrearProductoState();
  }
}

class _CrearProductoState extends State<CrearProducto> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _valorU = TextEditingController();
  final TextEditingController _insumo = TextEditingController();
  final TextEditingController _stockMin = TextEditingController();
  final TextEditingController _stockMax = TextEditingController();
  final TextEditingController _descripcion = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Producto'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InputCampo(
          label: "Nombre del Producto: ",
          controller: _name,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese el nombre del producto" : null,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 10),
        InputCampo(
          label: "Valor Unitario del producto: ",
          controller: _valorU,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese el valor unitario" : null,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        InputCampo(
          label: "Insumo asociado al producto: ",
          controller: _insumo,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese el insumo asociado al producto" : null,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 10),
        InputCampo(
          label: "Stock Minimo: ",
          controller: _stockMin,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese el stock minimo" : null,
          keyboardType: TextInputType.number,
        ),
        InputCampo(
          label: "Stock Máximo: ",
          controller: _stockMax,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese el stock máximo" : null,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        InputCampo(
          label: "Descripción del Producto: ",
          controller: _descripcion,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese la descripción del Producto" : null,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_name.text, _valorU.text, _insumo.text,
                  _stockMin.text, _stockMax.text, _descripcion.text);
            });
          },
          child: const Text('Crear Producto'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.name);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

class ProductosList extends StatefulWidget {
  const ProductosList({super.key});

  @override
  State<ProductosList> createState() => _ProductosListState();
}

class _ProductosListState extends State<ProductosList> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  DataModel? _dataModel;
  _getData() async {
    try {
      String url = 'https://coff-v-art-api.onrender.com/api/product';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        _dataModel = DataModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Lista Producto'))),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _dataModel!.products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_dataModel!.products[index].name),
                        Text(_dataModel!.products[index].valorU),
                        Text(_dataModel!.products[index].insumo),
                        Text(_dataModel!.products[index].stockMin),
                        Text(_dataModel!.products[index].stockMax),
                        Text(_dataModel!.products[index].descripcion),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit), // Icono 1
                              onPressed: () {
                                // Acción para redireccionar a vista 1
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete), // Icono 2
                              onPressed: () {
                                // Acción para redireccionar a vista 2
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Acción para redireccionar a CrearProducto
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CrearProducto(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
