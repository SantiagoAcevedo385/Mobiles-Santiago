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
        title:
            const Text('Agua', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(width: 3),
              ),
              child: Image.network(
                'https://th.bing.com/th/id/OIP.eX5eGRUiHKiQ65aawhsTSgHaJo?pid=ImgDet&rs=1',
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
                        'Información del Produto',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Nombre del Producto:',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Agua embotellada 200 ml',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Stock Máximo: ',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '25 Unidades',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Proveedor: :',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Cristal El agua de vida',
                        style: TextStyle(fontSize: 15),
                      ),
                      // Agrega más campos según sea necesario
                    ],
                  ),
                ),
              ),
            ),
          ]
        )
      )
    );
    
  }
}

class Aceite extends StatefulWidget {
  const Aceite({super.key});

  @override
  State<Aceite> createState() => _AceiteState();
}

class _AceiteState extends State<Aceite> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title:
            const Text('Agua', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(width: 3),
              ),
              child: Image.network(
                'https://th.bing.com/th/id/OIP.eX5eGRUiHKiQ65aawhsTSgHaJo?pid=ImgDet&rs=1',
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
                        'Información del Produto',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Nombre del Producto:',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Agua embotellada 200 ml',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Stock Máximo: ',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '25 Unidades',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Proveedor: :',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Cristal El agua de vida',
                        style: TextStyle(fontSize: 15),
                      ),
                      // Agrega más campos según sea necesario
                    ],
                  ),
                ),
              ),
            ),
          ]
        )
      )
    );
    
  }
}

