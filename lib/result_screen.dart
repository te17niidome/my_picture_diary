import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

/// The home screen
class ResultScreen extends StatefulWidget {
  /// Constructs a [ResultScreen]
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List items = [];
  AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          // onPressed: () => context.go('/take_picture'),
          onPressed: () {
            getData();
          },
          child: const Text('Go to the Details screen'),
        ),
      ),
    );
  }

  Future<void> getData() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = Uri.https('webapi.aitalk.jp', '/webapi/v5/ttsget.php', {
      'username': 'spajam2023',
      'password': 'gGLgPWBp',
      'speaker_name': 'akane_west_emo',
      'ext': 'wav',
      'text': '"hello world"'
    });

    print(url);
    print('"hello world"');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      // print("are you ok");
      // String audioBase64 =
      //     responseBody['audio']; // Key may vary, check AITalk API response

      // Uint8List audioBytes = base64.decode(audioBase64);

      // // Save the audio bytes to a temporary file
      // String tempPath = await createTempFile();
      // File tempFile = File(tempPath);
      // await tempFile.writeAsBytes(audioBytes);

      _audioPlayer.stop();
      // await _audioPlayer.play();
      // await _audioPlayer.play(tempPath, isLocal: true);
    } else {
      print('Failed to fetch audio: ${response.statusCode}');
    }
    // if (response.statusCode == 200) {
    //   // var jsonResponse = convert.jsonDecode(response.body.toString());
    //   // convert.jsonDecode(response.body) as Map<String, dynamic>;
    //   // var itemCount = jsonResponse['totalItems'];
    //   // print('Number of books about http: $itemCount.');
    //   // setState(() {
    //   //   items = jsonResponse['items'];
    //   // });
    // } else {
    //   print('Request failed with status: ${response.statusCode}.');
    // }
  }
}

Future<String> createTempFile() async {
  Directory tempDir = await getTemporaryDirectory();
  File tempFile = File('${tempDir.path}/temp_audio.wav');
  return tempFile.path;
}
