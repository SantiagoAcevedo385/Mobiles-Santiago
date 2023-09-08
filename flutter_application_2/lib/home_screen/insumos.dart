import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Componentes/input.dart';
import 'package:flutter_application_2/models/insumo.dart';
import 'package:http/http.dart' as http;

//https://frontendhbs.onrender.com/
Future<Album> createAlbum(String nombre, String costoSaco, String cantidad,
    String categoria, String descripcion) async {
  final response = await http.post(
    Uri.parse('https://coff-v-art-api.onrender.com/api/insumo'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nombre': nombre,
      'costoSaco': costoSaco,
      'cantidad': cantidad,
      'categoria': categoria,
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


Future<Album> deleteAlbum(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://coff-v-art-api.onrender.com/api/insumo/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON. After deleting,
    // you'll get an empty JSON `{}` response.
    // Don't return `null`, otherwise `snapshot.hasData`
    // will always return false on `FutureBuilder`.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a "200 OK response",
    // then throw an exception.
    throw Exception('Failed to delete album.');
  }
}






class Album {
  final String id;
  final String nombre;
  final double costoSaco;
  final int cantidad;
  final String categoria;
  final String descripcion;

  const Album(
      {required this.id,
      required this.nombre,
      required this.costoSaco,
      required this.cantidad,
      required this.categoria,
      required this.descripcion});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        id: json['id'],
        nombre: json['nombre'],
        costoSaco: json['costoSaco'],
        cantidad: json['cantidad'],
        categoria: json['categoria'],
        descripcion: json['descripcion']);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _costoSaco = TextEditingController();
  final TextEditingController _cantidad = TextEditingController();
  final TextEditingController _categoria = TextEditingController();
  final TextEditingController _descripcion = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear Insumo'),
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
          label: "Nombre del Insumo: ",
          controller: _nombre,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese el nombre del insumo" : null,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 10),
         InputCampo(
          label: "Costo del Saco del Insumo: ",
          controller: _costoSaco,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese el Costo del Saco" : null,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
       InputCampo(
          label: "Cantidad del Insumo: ",
          controller: _cantidad,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese la cantidad del Insumo" : null,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        InputCampo(
          label: "Categoría del Insumo: ",
          controller: _categoria,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese la categoría del Insumo" : null,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 10),
         InputCampo(
          label: "Descripción del Insumo: ",
          controller: _descripcion,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese la descripción del Insumo" : null,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_nombre.text, _costoSaco.text,
                  _cantidad.text, _categoria.text, _descripcion.text);
            });
          },
          child: const Text('Crear Insumo'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.nombre);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

class InsumosList extends StatefulWidget {
  const InsumosList({super.key});

  @override
  State<InsumosList> createState() => _InsumosListState();
}

class _InsumosListState extends State<InsumosList> {
  bool _isLoading = true;
  late Future<Album> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _getData();
    late Future<Album> _futureAlbum;

  }

  DataModel? _dataModel;
  _getData() async {
    try {
      String url = 'https://coff-v-art-api.onrender.com/api/insumo';
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
        appBar: AppBar(title: const Center(child: Text('Lista Insumo'))),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _dataModel!.insumos.length,
                
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_dataModel!.insumos[index].nombre),
                              Text(_dataModel!.insumos[index].costoSaco),
                              Text(_dataModel!.insumos[index].cantidad),
                              Text(_dataModel!.insumos[index].categoria),
                              Text(_dataModel!.insumos[index].descripcion),
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
                                setState(() {
                                  _futureAlbum = 
                                  deleteAlbum(_dataModel!.insumos[index].id.toString());
                                });
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
                    builder: (context) => const MyApp(),
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


