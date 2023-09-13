import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Componentes/input.dart';
import 'package:flutter_application_2/models/empaquetado.dart';

import 'package:http/http.dart' as http;


//https://frontendhbs.onrender.com/
Future<Album> createAlbum(String insumo, String productoFinal, String cantidad,
    String fechaInicio, String estado) async {
  final response = await http.post(
    Uri.parse('https://coff-v-art-api.onrender.com/api/empaquetado'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'insumo': insumo,
      'productoFinal': productoFinal,
      'cantidad': cantidad,
      'fechaInicio': fechaInicio,
      'estado': estado,
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
  final String insumo;
  final String productoFinal;
  final int cantidad;
  final DateTime fechaInicio;
  final String estado;

  const Album(
      {required this.id,
      required this.insumo,
      required this.productoFinal,
      required this.cantidad,
      required this.fechaInicio,
      required this.estado,
      });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        id: json['id'],
        insumo: json['insumo'],
        productoFinal: json['productoFinal'],
        cantidad: json['cantidad'],
        fechaInicio: json['fechaInicio'],
        estado: json['estado'],
      );
  }
}

class CrearEmpaquetado extends StatefulWidget {
  const CrearEmpaquetado({super.key});

  @override
  State<CrearEmpaquetado> createState() {
    return _CrearEmpaquetadoState();
  }
}

class _CrearEmpaquetadoState extends State<CrearEmpaquetado> {
  final TextEditingController _insumo = TextEditingController();
  final TextEditingController _productoFinal = TextEditingController();
  final TextEditingController _cantidad = TextEditingController();
  final TextEditingController _fechaInicio = TextEditingController();
  final TextEditingController _estado = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Empaquetado'),
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
          label: "Insumo del Empaquetado: ",
          controller: _insumo,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese el Insumo del empaquetado" : null,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 10),
        InputCampo(
          label: "Producto Final: ",
          controller: _productoFinal,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese el Producto Final" : null,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 10),
        InputCampo(
          label: "Cantidad: ",
          controller: _cantidad,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese la cantidad del empaquetado" : null,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        InputCampo(
          label: "Fecha de inicio: ",
          controller: _fechaInicio,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese la fecha de inicio" : null,
          keyboardType: TextInputType.datetime,
        ),
        InputCampo(
          label: "Estado: ",
          controller: _estado,
          obscureText: false,
          validator: (value) =>
              value!.isEmpty ? "Ingrese el estado del empaquetado" : null,
          keyboardType: TextInputType.text,
        ),        
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_insumo.text, _productoFinal.text,
                  _cantidad.text, _fechaInicio.text, _estado.text);
            });
          },
          child: const Text('Crear Empaquetado'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.insumo);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

class EmpaquetadosList extends StatefulWidget {
  const EmpaquetadosList ({super.key});

  @override
  State<EmpaquetadosList> createState()=> _EmpaquetadosListState();
}
class _EmpaquetadosListState extends State<EmpaquetadosList> {
  bool _isLoading= true;

  List<Empaquetado> empaquetados= [];

  final TextEditingController _insumo = TextEditingController();
  final TextEditingController _productoFinal = TextEditingController();
  final TextEditingController _cantidad = TextEditingController();
  final TextEditingController _fechaInicio = TextEditingController();
  final TextEditingController _estado = TextEditingController();

@override
void initState(){
  super.initState();
  _getData();
}
  _getData() async {
    try {
      String url = 'https://coff-v-art-api.onrender.com/api/empaquetado';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        setState(() {
          _isLoading = false;
          empaquetados = DataModel.fromJson(json.decode(res.body)).empaquetados; //
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _crearInsumo() async {
    try {
      final response = await http.post(
        Uri.parse('https://coff-v-art-api.onrender.com/api/empaquetado'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'insumo': _insumo.text,
          'productoFinal': _productoFinal.text,
          'cantidad': _cantidad.text,
          'fechaInicio': _fechaInicio.text,
          'estado': _estado.text,
        }),
      );

      if (response.statusCode == 201) {
        final nuevoEmpaquetado = Empaquetado.fromJson(jsonDecode(response.body));
        setState(() {
          empaquetados.add(nuevoEmpaquetado);
          _insumo.clear();
          _productoFinal.clear();
          _cantidad.clear();
          _fechaInicio.clear();
          _estado.clear();
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _editarInsumo(Empaquetado empaquetado) async {
    try {
      final response = await http.put(
        Uri.parse('https://coff-v-art-api.onrender.com/api/empaquetado'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
           "_id": empaquetado.id,
          'insumo': _insumo.text,
          'productoFinal': _productoFinal.text,
          'cantidad': _cantidad.text,
          'fechaInicio': _fechaInicio.text,
          'estado': _estado.text,
        }),
      );

      if (response.statusCode == 200) {
        final empaquetadoActualizado = Empaquetado.fromJson(jsonDecode(response.body));
        setState(() {
          empaquetado.insumo = empaquetadoActualizado.insumo;
          empaquetado.productoFinal = empaquetadoActualizado.productoFinal;
          empaquetado.cantidad = empaquetadoActualizado.cantidad;
          empaquetado.fechaInicio = empaquetadoActualizado.fechaInicio; 
          empaquetado.estado = empaquetadoActualizado.estado; 
          _insumo.clear();
          _productoFinal.clear();
          _cantidad.clear();
          _fechaInicio.clear();
          _estado.clear();
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _eliminarInsumo(Empaquetado empaquetado) async {
    try {
      final response = await http.delete(
        Uri.parse('https://coff-v-art-api.onrender.com/api/empaquetado/${empaquetado.id}'),
      );

      if (response.statusCode == 200) {
        setState(() {
          empaquetados.remove(empaquetado);
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Empaquetados'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Insumo')),
                  DataColumn(label: Text('Producto Final')),
                  DataColumn(label: Text('Cantidad')),
                  DataColumn(label: Text('Fecha de Inicio')),
                  DataColumn(label: Text('Estado')),
                  DataColumn(label: Text('Acciones')),
                ],
                rows: [
                  for (var empaquetado in empaquetados) 
                    DataRow(
                      cells: [
                        DataCell(Text(empaquetado.insumo)),
                        DataCell(Text(empaquetado.productoFinal.toString())),
                        DataCell(Text(empaquetado.cantidad.toString())),
                        DataCell(Text(empaquetado.fechaInicio.toString())),
                        DataCell(Text(empaquetado.estado.toString())),
                        DataCell(
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Editar insumo
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      _insumo.text = empaquetado.insumo;
                                      _productoFinal.text =
                                          empaquetado.productoFinal;
                                      _cantidad.text =
                                          empaquetado.cantidad;
                                      _fechaInicio.text =
                                          empaquetado.fechaInicio;
                                      _estado.text =
                                      empaquetado.estado;
                                      return AlertDialog(
                                        title: const Text('Editar Empaquetado'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(
                                              controller: _insumo,
                                              decoration:
                                                  const InputDecoration(labelText: 'Insumo'),
                                            ),
                                            TextFormField(
                                              controller: _productoFinal,
                                              decoration: const InputDecoration(
                                                  labelText: 'Producto Final'),
                                              keyboardType: TextInputType.text,
                                            ),
                                            TextFormField(
                                              controller: _cantidad,
                                              decoration: const InputDecoration(
                                                  labelText: 'Cantidad'),
                                              keyboardType: TextInputType.number,
                                            ),
                                            TextFormField(
                                              controller: _fechaInicio,
                                              decoration:
                                                  const InputDecoration(labelText: 'Fecha de Inicio'),
                                               keyboardType: TextInputType.datetime,
                                            ),
                                            TextFormField(
                                              controller: _estado,
                                              decoration:
                                                  const InputDecoration(labelText: 'Estado del empaqueatdo'),
                                               keyboardType: TextInputType.text,
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Cancelar'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              _editarInsumo(empaquetado); //
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Guardar'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Text('Editar'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Eliminar insumo
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Eliminar Empaquetado'),
                                        content:
                                            const Text('¿Estás seguro de que deseas eliminar este empaquetado?'),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Cancelar'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              _eliminarInsumo(empaquetado);
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Eliminar'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Text('Eliminar'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              _insumo.clear();
              _productoFinal.clear();
              _cantidad.clear();
              _fechaInicio.clear();
              _estado.clear();
              return AlertDialog(
                title: const Text('Crear Empaquetado'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _insumo,
                      decoration: const InputDecoration(labelText: 'Insumo'),
                    ),
                    TextFormField(
                      controller: _productoFinal,
                      decoration:
                          const InputDecoration(labelText: 'Producto Final'),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: _cantidad,
                      decoration: const InputDecoration(labelText: 'Cantidad'),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: _fechaInicio,
                      decoration: const InputDecoration(labelText: 'Fecha de Inicio'),
                      keyboardType: TextInputType.datetime,
                    ),
                    TextFormField(
                      controller: _estado,
                      decoration: const InputDecoration(labelText: 'Estado'),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _crearInsumo();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Crear Empaquetado'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
