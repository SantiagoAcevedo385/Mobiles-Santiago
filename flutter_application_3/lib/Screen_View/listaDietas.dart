
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screen_View/dietas.dart';



class MyList2 extends StatefulWidget {
  const MyList2({super.key});

  @override
  State<MyList2> createState() => _MyList2State();

}

class _MyList2State extends State<MyList2> {



  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: const Text('Lista de Dietas')),
     body: 
     ListView(
      children: [
         ListTile(
          title: const Text('Dieta para el Desayuno'),
          trailing: const Icon(Icons.battery_6_bar),
           onTap: (){
            final route = MaterialPageRoute(builder: (context)=> const Agua());
            Navigator.push(context, route);
          },
        ),
        ListTile(
          title: const Text('Dieta para el almuerzo'),
          trailing: const Icon(Icons.water_drop_outlined),
           onTap: (){
            final route = MaterialPageRoute(builder: (context)=> const Almuerzo());
            Navigator.push(context, route);
          },
        ),
         ListTile(
          title: const Text('Dieta para la Cena'),
          trailing: const Icon(Icons.water_drop_outlined),
           onTap: (){
            final route = MaterialPageRoute(builder: (context)=> const Cena());
            Navigator.push(context, route);
          },
        ),
        
        
      ],
     ),
    );
  }
}