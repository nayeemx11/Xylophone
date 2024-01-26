import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xlophone',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();
  void playAudio(var noteNumber) async {
    await player.play(UrlSource('audio/note$noteNumber.wav'));
  }

  GestureDetector noteButton(
      BuildContext context, Color color, int noteNumber) {
    return GestureDetector(
      onTap: () {
        playAudio(noteNumber);
      },
      child: Container(
        height: (MediaQuery.of(context).size.height / 7) - 8,
        width: MediaQuery.of(context).size.width,
        color: color, // Use the provided color parameter
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text("Xlophone play"),
        backgroundColor: Colors.greenAccent,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: <Widget>[
            noteButton(context, Colors.red, 1),
            noteButton(context, Colors.amber, 2),
            noteButton(context, Colors.yellow, 3),
            noteButton(context, Colors.teal, 4),
            noteButton(context, Colors.green, 5),
            noteButton(context, Colors.blue, 6),
            noteButton(context, Colors.purple, 7),
          ],
        ),
      )),
    );
  }
}
