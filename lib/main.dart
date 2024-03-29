import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Text to Speech")),
        body: HomeView(),
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FlutterTts Tts = FlutterTts();
  final TextEditingController textEditing_Controller = TextEditingController();

  speakText(String text) async {
    await Tts.setLanguage("zh-TW");
    await Tts.setPitch(1);
    await Tts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.only(
            left: 32,
            right: 32,
          ),
          child: TextField(
            controller: textEditing_Controller,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        ElevatedButton(
          child: Text("Start"),
          onPressed: () {
            speakText(textEditing_Controller.text);
          },
        )
      ]),
    );
  }
}
