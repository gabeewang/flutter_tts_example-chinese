import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

final TextEditingController textEditing_Controller = TextEditingController();

void main(){
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Text to Speech")
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: (){
            textEditing_Controller.clear();
          },
        ),
        body: TtsScreen(),
      ),
    );
  }
}

class TtsScreen extends StatefulWidget {
  const TtsScreen({super.key});

  @override
  State<TtsScreen> createState() => _TtsScreenState();
}

class _TtsScreenState extends State<TtsScreen> {
  final FlutterTts Tts = FlutterTts();

  speakText(String text) async {
    await Tts.setLanguage("zh-TW");
    await Tts.setPitch(1);
    await Tts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24),
            child: TextField(
              controller: textEditing_Controller,
              maxLines: 3,
            )
          ),
          ElevatedButton(
            child: Icon(Icons.volume_up),
            onPressed: (){
              speakText(textEditing_Controller.text);
            },
          )
        ],
      )
    );
  }
}
