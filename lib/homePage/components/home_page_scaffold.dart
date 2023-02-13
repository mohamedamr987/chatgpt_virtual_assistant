import 'package:chatgpt_virtual_assistant/homePage/controller.dart';
import 'package:chatgpt_virtual_assistant/homePage/state.dart';
import 'package:chatgpt_virtual_assistant/widgets/bloc_temp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../widgets/general_text.dart';

class HomePageScaffold extends StatelessWidget {
  const HomePageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController blocController = HomePageController.of(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder(
          bloc: blocController,
          buildWhen: (previous, current) => current is! HomeUpdate,
          builder: (context, state){
            print(state);
            return SafeArea(
              child: BlocTempWidget(
                successWidget: Expanded(
                    child: Center(
                      child: (){
                        if(state is HomeLoadingResponse){
                          return LoadingAnimationWidget.beat(
                            color: Colors.white,
                            size: 100,
                          );
                        }
                        return GeneralText(
                          text: blocController.openAiResponse ?? 'Tap the microphone to start listening...',
                        );
                      }(),
                    )
                ),
                errorState: state is HomeError,
                loadingState: state is HomeLoading,
              ),
            );
          },
        ),
        floatingActionButton: BlocBuilder(
          bloc: blocController,
          buildWhen: (previous, current) => true,
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: blocController.micOnPressed,
              tooltip: 'Listen',
              child: Icon(blocController.speechToTextHelper.speechToText.isListening ? Icons.mic_off : Icons.mic),
            );
          },
        )
    );
  }
}