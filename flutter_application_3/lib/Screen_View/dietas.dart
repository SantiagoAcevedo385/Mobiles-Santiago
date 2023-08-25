import 'package:flutter/material.dart';

class Agua extends StatefulWidget {
  const Agua({super.key});

  @override
  State<Agua> createState() => _AguaState();
}

class _AguaState extends State<Agua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dieta para el desayuno Avena, Kiwi y Chía', style: TextStyle(color: Colors.black)),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          const SizedBox(height: 20),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(width: 3),
            ),
            child: Image.network(
              'https://th.bing.com/th/id/OIP.XFLWF3IMNhP_B3HJuNK-2AHaHa?pid=ImgDet&rs=1',
            ),
          ),
          const SizedBox(
            width: double.infinity, // Establece el ancho al máximo
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información de la Dieta',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Nombre de la Dieta:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Desayuno de Avena, Chía y Kiwi',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Descripción de la Dieta: ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'La avena es uno de los mejores alimentos para la dieta y los desayunos. De hecho, una reciente investigación publicada en la revista Nutrients sugiere que consumir desayunos con avena mejora la calidad de la dieta, ya que brinda nutrientes como la fibra, grasas, proteínas insaturadas y vitaminas y minerales.',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Ingredientes:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '- 1 Kiwi Mediano \n- 1 Taza de leche desnatada (250 ml)\n- 3 Cucharadas de Avena en Hojuelas (45 g)\n-1 Cucharada de Semillas de Chía',
                      style: TextStyle(fontSize: 15),
                    ),
                    // Agrega más campos según sea necesario
                  ],
                ),
              ),
            ),
          ),
        ])));
  }
}

class Almuerzo extends StatefulWidget {
  const Almuerzo({super.key});

  @override
  State<Almuerzo> createState() => _AlmuerzoState();
}

class _AlmuerzoState extends State<Almuerzo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dieta para el almuerzo Crema de Espnicas', style: TextStyle(color: Colors.black)),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          const SizedBox(height: 20),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(width: 3),
            ),
            child: Image.network(
              'https://th.bing.com/th/id/R.6c7b4da979eab976bccffdd17c8541d9?rik=aW7dvRspJjEqDw&riu=http%3a%2f%2festag.fimagenes.com%2fimg%2f1%2f1%2fT%2f6%2fS%2f1T6S_900.jpg&ehk=fn51RqPzLEn%2fec0Wi6oEdLx2Ahu2m0jkM6iN38nzTZc%3d&risl=&pid=ImgRaw&r=0',
            ),
          ),
          const SizedBox(
            width: double.infinity, // Establece el ancho al máximo
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información de la Dieta',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Nombre de la Dieta:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Almuerzo Crema de Espinacas',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Descripción de la Dieta: ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Una buena forma de comer espinacas es prepararlas en deliciosas cremas que son ideales para el almuerzo, bien sea sola o para comenzar cualquier comida que vayas a preparar.',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Ingredientes:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '- Garbanzos Lavados \n- Curry en Polvo\n- Caldo de Pollo\n- Ajo en polvo\n- Jengibre en Polvo\n- Hojas de Espinaca Picadas\n- Agua\n- Sal',
                      style: TextStyle(fontSize: 15),
                    ),
                    // Agrega más campos según sea necesario
                  ],
                ),
              ),
            ),
          ),
        ])));
  }
}

class Cena extends StatefulWidget {
  const Cena({super.key});

  @override
  State<Cena> createState() => _CenaState();
}

class _CenaState extends State<Cena> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dieta para la cena Spaghetti con Calabacín y Vinagreta', style: TextStyle(color: Colors.black)),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          const SizedBox(height: 20),
          Container(
            height: 125,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(width: 3),
            ),
            child: Image.network(
              'https://th.bing.com/th/id/OIP.-ib6NDMV00jPX0353aUnrwHaFj?pid=ImgDet&rs=1',
            ),
          ),
          const SizedBox(
            width: double.infinity, // Establece el ancho al máximo
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información de la Dieta',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Nombre de la Dieta:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Cena Spagetthi con Calabacín y Vinagreta',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Descripción de la Dieta: ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Bendito calabacín que tantísimo juego nos ofrece en la cocina. En cremas calientes o frías, buñuelos de calabacín griegos, tortilla, o mi querido zarangollo murciano, también le podemos sacar partido en suculentos dulces. Pero hoy recurrimos a esta hortaliza para preparar una receta ligera y rápida: espirales o espaquetis de calabacín con vinagreta de sésamo.',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Ingredientes:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '- 2 Calabacín pequeño \n- 2 Diente de Ajo\n- Aceite de Oliva Virgen Extra (15 ml)\n- Vinagre de Manzana (5 ml)\n- Zumo de Limón (5 ml)\n- Queso Parmesano',
                      style: TextStyle(fontSize: 15),
                    ),
                    // Agrega más campos según sea necesario
                  ],
                ),
              ),
            ),
          ),
        ])));
  }
}