
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen_views/cart.dart';
import 'package:flutter_application_2/screen_views/home_screen.dart';
import 'package:flutter_application_2/screen_views/products.dart';






class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();

}

class _MyListState extends State<MyList> {



  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: const Text('Lista de productos'), backgroundColor: Colors.amber,),
     body: 
     ListView(
      children: [
         ListTile(
          title: const Text('Agua'),
          trailing: const Icon(Icons.battery_6_bar),
           onTap: (){
            final route = MaterialPageRoute(builder: (context)=> const Agua());
            Navigator.push(context, route);
          },
        ),
        ListTile(
          title: const Text('Aceite'),
          trailing: const Icon(Icons.water_drop_outlined),
           onTap: (){
            final route = MaterialPageRoute(builder: (context)=> const Aceite());
            Navigator.push(context, route);
          },
        ),
        const ListTile(
          title: Text('Sal'),
          trailing: Icon(Icons.rice_bowl_sharp),
        ),
        ListTile(
          title: const Text('Hoja de Vida - 250.000COP'),
          trailing: const Icon(Icons.person_2),
          onTap: (){
            final route = MaterialPageRoute(builder: (context)=> const CartScreen());
            Navigator.push(context, route);
          },
        )
      ],
     ),
    );
  }
}