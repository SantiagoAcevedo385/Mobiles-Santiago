
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screen_View/calorias.dart';
import 'package:flutter_application_3/Screen_View/contacto.dart';
import 'package:flutter_application_3/Screen_View/dietas.dart';
import 'package:flutter_application_3/Screen_View/imc.dart';
import 'package:flutter_application_3/Screen_View/listaDietas.dart';
import 'package:flutter_application_3/Screen_View/listaRutinas.dart';
import 'package:flutter_application_3/Screen_View/presion.dart';



class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();

}

class _MyListState extends State<MyList> {



  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: const Text('Menú Sano')),
     body: 
     ListView(
      children: [
         ListTile(
          title: const Text('Lista de Dietas'),
          trailing: const Icon(Icons.battery_6_bar),
           onTap: (){
            final route = MaterialPageRoute(builder: (context)=> const MyList2());
            Navigator.push(context, route);
          },
        ),
         ListTile(
          title: const Text('Calcular IMC'),
          trailing: const Icon(Icons.water_drop_outlined),
           onTap: (){
            final route = MaterialPageRoute(builder: (context)=> const Imc());
            Navigator.push(context, route);
          },
        ),
         ListTile(
          title: const Text('Calcular Calorías'),
          trailing: const Icon(Icons.water_drop_outlined),
           onTap: (){
            final route = MaterialPageRoute(builder: (context)=> const Calorias());
            Navigator.push(context, route);
          },
        ),
        ListTile(
          title: const Text('Lista de Rutinas de Ejercicio'),
          trailing: const Icon(Icons.water_drop_outlined),
           onTap: (){
            final route = MaterialPageRoute(builder: (context)=> const MyList3());
            Navigator.push(context, route);
          },
        ),
         ListTile(
          title: const Text('Calcular Presión Arterial'),
          trailing: const Icon(Icons.water_drop_outlined),
           onTap: (){
            final route = MaterialPageRoute(builder: (context)=> const Presion());
            Navigator.push(context, route);
          },
        ),
        ListTile(
          title: const Text('Contacto'),
          trailing: const Icon(Icons.water_drop_outlined),
           onTap: (){
            final route = MaterialPageRoute(builder: (context)=> const Contacto());
            Navigator.push(context, route);
          },
        ),
        
      ],
     ),
    );
  }
}