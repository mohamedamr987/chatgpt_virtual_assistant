import 'package:chatgpt_virtual_assistant/homePage/controller.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextHelper{
  final SpeechToText speechToText = SpeechToText();
  bool speechInitialized = false;
  String? lastWords;
  HomePageController? blocController;

  Future<void> initSpeech() async {
    speechInitialized = await speechToText.initialize();
  }

  void startListening() async {
    await speechToText.listen(onResult: _onSpeechResult);
    blocController?.update();
  }

  void stopListening() async {
    await speechToText.stop();
    blocController?.getOpenAiResponse(lastWords!);
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    lastWords = result.recognizedWords;
    blocController?.update();
  }
}