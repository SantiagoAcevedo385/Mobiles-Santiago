// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());


class DataModel {
  DataModel({
    required this.empaquetados
  });
  
  List<Empaquetado> empaquetados;

  factory DataModel.fromJson(Map<String, dynamic> json)=> DataModel(
    empaquetados: List<Empaquetado>.from(json["empaquetados"].map((x)=> Empaquetado.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "empaquetados": List<dynamic>.from(empaquetados.map((x)=> x.toJson()))
  };
}


class Empaquetado {
    String id;
    String insumo;
    String productoFinal;
    String cantidad;
    String fechaInicio;
    String estado;


    Empaquetado({
        required this.id,
        required this.insumo,
        required this.productoFinal,
        required this.cantidad,
        required this.fechaInicio,
        required this.estado,

    });

    factory Empaquetado.fromJson(Map<String, dynamic> json) => Empaquetado(
        id: json["_id"],
        insumo: json["insumo"],
        productoFinal: json["productoFinal"],
        cantidad: json["cantidad"],
        fechaInicio: json["fechaInicio"],
        estado: json["estado"],

    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "insumo": insumo,
        "productoFinal": productoFinal,
        "cantidad": cantidad,
        "fechaInicio": fechaInicio,
        "estado": estado,

    };
}
