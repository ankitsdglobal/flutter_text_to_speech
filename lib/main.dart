import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
         appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
        ),
        title: Text('Text To Voice'),
      ),
        body: TextToSpeech(),
      )
    );
  }
}

class TextToSpeech extends StatelessWidget {

 final FlutterTts flutterTts = FlutterTts();
  
  @override 
  Widget build(BuildContext context) {

    TextEditingController textEditingController = TextEditingController();


  Future _speak(String text) async {
    print(text);
  //  print(await flutterTts.getLanguages);
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.4);
    if(text != '') {
     await flutterTts.speak(text);
    } else {
      await flutterTts.speak('Hello user! please enter some text and i will speak that.');
    }
   }


    return Container(
      alignment: Alignment.center,
      child: 
         Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: textEditingController,
            ),
            RaisedButton(
        child: Text("Press this to say hello"),
        onPressed: () => _speak(textEditingController.text),),
          ],
         )
    );
  }

}
