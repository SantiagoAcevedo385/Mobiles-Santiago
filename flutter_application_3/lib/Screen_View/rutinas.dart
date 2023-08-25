import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TrenS extends StatefulWidget {
  const TrenS({super.key});

  @override
// ignore: library_private_types_in_public_api
  _TrenSState createState() => _TrenSState();
}

class _TrenSState extends State<TrenS> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    // ignore: deprecated_member_use
    controller = VideoPlayerController.network(
        'https://www.fluttercampus.com/video.mp4');
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rutina de Tren Superior"),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
        Text("Duración Total del Video: ${controller.value.duration}"),
        VideoProgressIndicator(controller,
            allowScrubbing: true,
            colors: const VideoProgressColors(
              backgroundColor: Colors.redAccent,
              playedColor: Colors.green,
              bufferedColor: Colors.purple,
            )),
        Row(children: [
          IconButton(
              onPressed: () {
                if (controller.value.isPlaying) {
                  controller.pause();
                } else {
                  controller.play();
                }

                setState(() {});
              },
              icon: Icon(
                  controller.value.isPlaying ? Icons.pause : Icons.play_arrow)),
          IconButton(
              onPressed: () {
                controller.seekTo(const Duration(seconds: 0));

                setState(() {});
              },
              icon: const Icon(Icons.stop)),
              const SizedBox(height: 10),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Información de la Rutina',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Nombre de la Rutina:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rutina de Tren Superior',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Descripción de la Rutina: ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Antes de ponernos manos a la obra con el mejor entrenamiento de tren superior (aunque, también, puedes probar entrenamiento corto de tren superior).',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Instrucciones de la rutina:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '- Tiempo: 20 Minutos \n- Equipo: Dos mancuernas de 2 a 5 kilos, un banco\n- Instrucciones: comienza con el primer ejercicio y completa tantas repeticiones como te sea posible en 50 segundos, manteniendo la postura correcta.',
                    style: TextStyle(fontSize: 15),
                  ),
                  // Agrega más campos según sea necesario
                ],
              ),
            ),
          )
        ])
      ])),
    );
  }
}
class TrenI extends StatefulWidget {
  const TrenI({super.key});

  @override
// ignore: library_private_types_in_public_api
  _TrenIState createState() => _TrenIState();
}

class _TrenIState extends State<TrenI> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    // ignore: deprecated_member_use
    controller = VideoPlayerController.network(
        'https://www.fluttercampus.com/video.mp4');
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rutina de Tren Inferior"),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
        Text("Duración Total del Video: ${controller.value.duration}"),
        VideoProgressIndicator(controller,
            allowScrubbing: true,
            colors: const VideoProgressColors(
              backgroundColor: Colors.redAccent,
              playedColor: Colors.green,
              bufferedColor: Colors.purple,
            )),
        Row(children: [
          IconButton(
              onPressed: () {
                if (controller.value.isPlaying) {
                  controller.pause();
                } else {
                  controller.play();
                }

                setState(() {});
              },
              icon: Icon(
                  controller.value.isPlaying ? Icons.pause : Icons.play_arrow)),
          IconButton(
              onPressed: () {
                controller.seekTo(const Duration(seconds: 0));

                setState(() {});
              },
              icon: const Icon(Icons.stop)),
              const SizedBox(height: 10),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Información de la Rutina',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Nombre de la Rutina:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rutina de Tren Inferior',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Descripción de la Rutina: ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Antes de ponernos manos a la obra con el mejor entrenamiento de tren Inferior (aunque, también, puedes probar entrenamiento corto de tren superior).',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Instrucciones de la rutina:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '- Tiempo: 20 Minutos \n- Equipo: Dos mancuernas de 2 a 5 kilos, un banco\n- Instrucciones: comienza con el primer ejercicio y completa tantas repeticiones como te sea posible en 50 segundos, manteniendo la postura correcta.',
                    style: TextStyle(fontSize: 15),
                  ),
                  // Agrega más campos según sea necesario
                ],
              ),
            ),
          )
        ])
      ])),
    );
  }
}
class Bicep extends StatefulWidget {
  const Bicep({super.key});

  @override
// ignore: library_private_types_in_public_api
  _BicepState createState() => _BicepState();
}

class _BicepState extends State<Bicep> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    // ignore: deprecated_member_use
    controller = VideoPlayerController.network(
        'https://www.fluttercampus.com/video.mp4');
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rutina de Bicep"),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
        Text("Duración Total del Video: ${controller.value.duration}"),
        VideoProgressIndicator(controller,
            allowScrubbing: true,
            colors: const VideoProgressColors(
              backgroundColor: Colors.redAccent,
              playedColor: Colors.green,
              bufferedColor: Colors.purple,
            )),
        Row(children: [
          IconButton(
              onPressed: () {
                if (controller.value.isPlaying) {
                  controller.pause();
                } else {
                  controller.play();
                }

                setState(() {});
              },
              icon: Icon(
                  controller.value.isPlaying ? Icons.pause : Icons.play_arrow)),
          IconButton(
              onPressed: () {
                controller.seekTo(const Duration(seconds: 0));

                setState(() {});
              },
              icon: const Icon(Icons.stop)),
              const SizedBox(height: 10),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Información de la Rutina',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Nombre de la Rutina:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rutina de Bicep',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Descripción de la Rutina: ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Antes de ponernos manos a la obra con el mejor entrenamiento de Bicep (aunque, también, puedes probar entrenamiento corto de tren superior).',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Instrucciones de la rutina:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '- Tiempo: 20 Minutos \n- Equipo: Dos mancuernas de 2 a 5 kilos, un banco\n- Instrucciones: comienza con el primer ejercicio y completa tantas repeticiones como te sea posible en 50 segundos, manteniendo la postura correcta.',
                    style: TextStyle(fontSize: 15),
                  ),
                  // Agrega más campos según sea necesario
                ],
              ),
            ),
          )
        ])
      ])),
    );
  }
}

