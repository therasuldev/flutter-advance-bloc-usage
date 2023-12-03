import 'dart:developer';

import 'package:first_flutter_project/animations.dart';
import 'package:first_flutter_project/lesson/snackbar_without_context.dart';
import 'package:first_flutter_project/news.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'lesson/pages/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: SnackBarClass.snackbarKey,
      debugShowCheckedModeBanner: false,
      home: const HomeScaffold(),
    );
  }
}

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({super.key});

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  //final selectedTexts = ['aa', 'bb'];
  final sentence = 'asnac aa bibcic bb iecoeince jk scsmonscsc smcosnvd';

  List<String> overrideText(String sentence) {
    List<String> newSentence = [];
    int defaultIndex = 0;
    int lastIndex = 0;

    for (var index = 0; index < sentence.length; index++) {
      if (sentence[index] == ' ') {
        if (index > lastIndex) {
          newSentence.add(sentence.substring(lastIndex, index).trim());
          defaultIndex++;
        }
        lastIndex = index + 1;
      } else if (index + 1 == sentence.length) {
        newSentence.add(sentence.substring(lastIndex, index + 1).trim());
      }
    }

    return newSentence;
  }

  late List<String> words;

  @override
  void initState() {
    super.initState();
    words = overrideText(sentence);
  }

  TextStyle? createStyle(String word, List<String> selectedWords) {
    if (selectedWords.contains(word)) {
      return const TextStyle(color: Colors.blue);
    }
    return null;
  }

  TapGestureRecognizer? createOnTaps(String word, Map<String, String> selectedWords) {
    if (selectedWords.keys.contains(word)) {
      return TapGestureRecognizer()
        ..onTap = () {
          log(selectedWords[word]!);
        };
    }

    return null;
  }

  String sentenceResult(String word, List<String> newLines) {
    String sentence = '';
    if (newLines.contains(word)) {
      sentence += '\n$word ';
    } else {
      sentence += '$word ';
    }
    return sentence;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text.rich(
            TextSpan(
              children: List.generate(
                words.length,
                (index) => TextSpan(
                  text: sentenceResult(words[index], ['bb', 'smcosnvd']),
                  style: createStyle(words[index], ['aa', 'jk', 'jj', 'smcosnvd']),
                  recognizer: createOnTaps(words[index], {'aa': 'www.aa.com'}),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
