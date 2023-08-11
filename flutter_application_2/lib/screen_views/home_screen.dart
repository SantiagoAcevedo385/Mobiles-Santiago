import 'package:flutter/material.dart';


// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//     @override
//   State<StatefulWidget> createState()=> _HomeScreenState();
//   }



// class _HomeScreenState extends State<HomeScreen> {   
//   int randomnumero = 0;
//   int randomnumero2 = 0;
//   int randonnumero3= 0;
//    int randomNumber(){
//     int random = Random().nextInt(10) + 0; //1000 is MAX value
//     return random;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.greenAccent,
//       appBar: AppBar(
//         backgroundColor: Colors.amberAccent,
//         title: const Text('Mi primer Iphone', style: TextStyle(color: Colors.black) ),
//       ),
//       body: Center( child: Column( mainAxisAlignment: MainAxisAlignment.center, 
//       children: [const Text('Número de la Suerte', style: TextStyle(fontSize: 50),),
//       Text('$randomnumero$randomnumero2$randonnumero3', style:const TextStyle(fontSize: 50))])),
//       floatingActionButton: Stack(children: [
//         Positioned(bottom: 10,
//         right: 10,
//         child: FloatingActionButton(onPressed: (){
//           setState(() {
//             randomnumero = randomNumber();
//             randomnumero2 = randomNumber();
//             randonnumero3 = randomNumber();
//           });
//         },
//         child: const Icon(Icons.loop),
//         )),
//       ]),
//     );
//   }
  

// }
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

    @override
  State<StatefulWidget> createState()=> _HomeScreenState();
  }


class _HomeScreenState extends State<HomeScreen> {  
  int contadorA = 0;
  int contadorB = 0;
  int contadorC = 0;
  int contadorTotal = 0;
  String ganador = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text('Mi primer Iphone', style: TextStyle(color: Colors.black) ),
      ),
      body: Center( child: Column( mainAxisAlignment: MainAxisAlignment.center, 
      children: [ 
        Text('$ganador', style:const TextStyle(fontSize: 45)),
        Text('Votos A: $contadorA\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVotos B: $contadorB\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVotos C: $contadorC',
      style: const TextStyle(fontSize: 50),),
      Text('Total de Votos: $contadorTotal', style:const TextStyle(fontSize: 45))
      ])),
      floatingActionButton: Stack(children: [
        Positioned(bottom: 10,
        right: 10,
        child: FloatingActionButton(
          backgroundColor: Colors.blue, foregroundColor: Colors.white,
          onPressed: (){
          setState(() {
            contadorA ++;
            contadorTotal ++;	
            if(contadorA > contadorB && contadorA > contadorC){
              ganador = 'Ganador: A';
            }else if(contadorA == contadorB && contadorA > contadorC){
              ganador = 'Empate A y B';
            }else if(contadorA > contadorB && contadorA == contadorC){
              ganador = 'Empate A y C';
            }else if(contadorA == contadorB && contadorA == contadorC){
              ganador = 'Empate entre todos';
            }
          }
        );
        },
        child: const Text('A'),
        )),
        Positioned(bottom: 10,
        right: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.red, foregroundColor: Colors.white,
          
          onPressed: (){
          setState(() {
            contadorB ++;
            contadorTotal ++;
            if(contadorB > contadorA && contadorB > contadorC){
              ganador = 'Ganador: B';
            }else if(contadorB == contadorA && contadorB > contadorC){
              ganador = 'Empate B y A';
            }else if(contadorB > contadorA && contadorB == contadorC){
              ganador = 'Empate B y C';
            }else if(contadorA == contadorB && contadorA == contadorC){
              ganador = 'Empate entre todos';

            }
          });
        },
        child: const Text('B'),
        )),
        Positioned(bottom: 10,
        right: 130,
        child: FloatingActionButton(
          backgroundColor: Colors.yellow, foregroundColor: Colors.white,
          onPressed: (){
          setState(() {
            contadorC ++;
            contadorTotal ++;
            if(contadorC > contadorA && contadorC > contadorB){
              ganador = 'Ganador: C';
            }else if(contadorC == contadorA && contadorC > contadorB){
              ganador = 'Empate C y A';
            }else if(contadorC > contadorA && contadorC == contadorB){
              ganador = 'Empate C y B';
            }else if(contadorA == contadorB && contadorA == contadorC){
              ganador = 'Empate entre todos';
            }
          });
        },
        child: const Text('C'),
        )),

        ]),
        
      
    );
  }
  

}