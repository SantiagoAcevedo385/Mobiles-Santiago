import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController myinput = TextEditingController();
  @override
  void initState() {
    myinput.text = "Servicio Nacional de Aprendizaje";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Hoja de vida', style: TextStyle(color: Colors.black)),
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
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKYco91xrPacMsmdCL9y50K8iMz8eCQPA_oxIaRgzPOs65d8gawvgEmeh67vM40OtmSdw&usqp=CAU',
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
                        'Información Personal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Nombre Completo:',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Santiago Acevedo Vélez',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Fecha de Nacimiento: ',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '9 de junio de 2002',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Télefono:',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '30000000',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Correo Eléctronico:',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'saacevedo88@misena.edu.co',
                        style: TextStyle(fontSize: 15),
                      ),
                      // Agrega más campos según sea necesario
                    ],
                  ),
                ),
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
                        'Información Académica',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Institución:',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'I.E Luis Lopéz de Mesa',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Bachiller Técnico en Programación de Software',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Institución de educación superior:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Servicio Nacional de Aprendizaje',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Análisis y Desarrollo de Software',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Harvard University',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Cybersecurity Engineering',
                        style: TextStyle(fontSize: 15),
                      ),
                      // Agrega más campos según sea necesario
                    ],
                  ),
                ),
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
                        'Conocimientos Técnicos',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Nombre Completo:',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Santiago Acevedo Vélez',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Fecha de Nacimiento: ',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '9 de junio de 2002',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Télefono:',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '30000000',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Correo Eléctronico:',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'saacevedo88@misena.edu.co',
                        style: TextStyle(fontSize: 15),
                      ),
                      // Agrega más campos según sea necesario
                    ],
                  ),
                ),
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
                        'Información Personal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Nombre Completo:',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Santiago Acevedo Vélez',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Fecha de Nacimiento: ',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '9 de junio de 2002',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Télefono:',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '30000000',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Correo Eléctronico:',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'saacevedo88@misena.edu.co',
                        style: TextStyle(fontSize: 15),
                      ),
                      // Agrega más campos según sea necesario
                    ],
                  ),
                ),
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
                        'Información Personal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Nombre Completo:',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Santiago Acevedo Vélez',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Fecha de Nacimiento: ',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '9 de junio de 2002',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Télefono:',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '30000000',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Correo Eléctronico:',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'saacevedo88@misena.edu.co',
                        style: TextStyle(fontSize: 15),
                      ),
                      // Agrega más campos según sea necesario
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
