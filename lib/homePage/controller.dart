import 'package:chatgpt_virtual_assistant/homePage/helper/speech_to_text_helper.dart';
import 'package:chatgpt_virtual_assistant/homePage/helper/text_to_speech_helper.dart';
import 'package:chatgpt_virtual_assistant/homePage/repo/open_ai_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';

class HomePageController extends Cubit<HomeState>
{
  HomePageController() :super(HomeInit()){
    speechToTextHelper.blocController = this;
    textToSpeechHelper.blocController = this;
    initSpeech();
    textToSpeechHelper.initTts();
  }
  static HomePageController of(context)=> BlocProvider.of(context);
  SpeechToTextHelper speechToTextHelper = SpeechToTextHelper();
  TextToSpeechHelper textToSpeechHelper = TextToSpeechHelper();
  OpenAiRepo openAiRepo = OpenAiRepo();
  String? openAiResponse;
  void initSpeech() async {
    try{
      emit(HomeLoading());
      await speechToTextHelper.initSpeech();
      emit(HomeDone());
    }
    catch(e){
      emit(HomeError());
    }
  }

  void micOnPressed() async {
    if(speechToTextHelper.speechToText.isListening){
      speechToTextHelper.stopListening();
    }
    else{
      await textToSpeechHelper.flutterTts.stop();
      await Future.delayed(const Duration(milliseconds: 500));
      speechToTextHelper.startListening();
    }
  }

  void update(){
    emit(HomeUpdate());
  }

  void getOpenAiResponse(String questions) async {
    emit(HomeLoadingResponse());
    final response = await openAiRepo.getOpenAiResponse(questions);
    response.fold(
      (l) => emit(HomeError()),
      (r) {
        openAiResponse = r;
        textToSpeechHelper.speak(r);
        emit(HomeDone());
      },
    );
  }

  @override
  Future<void> close() async {
    await speechToTextHelper.speechToText.stop();
    await speechToTextHelper.speechToText.cancel();
    textToSpeechHelper.flutterTts.stop();
    return super.close();
  }
}
