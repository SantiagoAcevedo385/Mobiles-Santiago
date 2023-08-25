
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screen_View/dietas.dart';
import 'package:flutter_application_3/Screen_View/rutinas.dart';



class MyList3 extends StatefulWidget {
  const MyList3({super.key});

  @override
  State<MyList3> createState() => _MyList3State();

}

class _MyList3State extends State<MyList3> {



  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: const Text('Lista de Rutinas')),
     body: 
     ListView(
      children: [
         ListTile(
          title: const Text('Rutina para Tren superior'),
          trailing: const Icon(Icons.battery_6_bar),
           onTap: (){
            final route = MaterialPageRoute(builder: (context)=> const TrenS());
            Navigator.push(context, route);
          },
        ),
        ListTile(
          title: const Text('Rutina para Tren Inferior'),
          trailing: const Icon(Icons.water_drop_outlined),
           onTap: (){
            final route = MaterialPageRoute(builder: (context)=> const TrenI());
            Navigator.push(context, route);
          },
        ),
          ListTile(
          title: const Text('Rutina para Bicep'),
          trailing: const Icon(Icons.water_drop_outlined),
           onTap: (){
            final route = MaterialPageRoute(builder: (context)=> const Bicep());
            Navigator.push(context, route);
          },
        ),
        
        
      ],
     ),
    );
  }
}
