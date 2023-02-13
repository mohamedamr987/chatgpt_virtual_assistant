import 'dart:io';

import 'package:chatgpt_virtual_assistant/homePage/controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped, paused, continued }

class TextToSpeechHelper {
  FlutterTts flutterTts = FlutterTts();
  TtsState ttsState = TtsState.stopped;
  HomePageController? blocController;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;

  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
      print("Playing");
      ttsState = TtsState.playing;
      blocController?.update();
    });

    if (isAndroid) {
      flutterTts.setInitHandler(() {
        print("TTS Initialized");
      });
    }

    flutterTts.setCompletionHandler(() {
      print("Complete");
      ttsState = TtsState.stopped;
      blocController?.update();
    });

    flutterTts.setCancelHandler(() {
      print("Cancel");
      ttsState = TtsState.stopped;
      blocController?.update();
    });

    flutterTts.setPauseHandler(() {
      print("Paused");
      ttsState = TtsState.paused;
      blocController?.update();
    });

    flutterTts.setContinueHandler(() {
      print("Continued");
      ttsState = TtsState.continued;
      blocController?.update();
    });

    flutterTts.setErrorHandler((msg) {
      print("error: $msg");
      ttsState = TtsState.stopped;
      blocController?.update();
    });
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }
  void speak(String text) async => await flutterTts.speak(text);

}
