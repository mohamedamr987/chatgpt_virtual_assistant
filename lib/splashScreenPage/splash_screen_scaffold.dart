import 'package:chatgpt_virtual_assistant/widgets/general_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../size_config.dart';

class SplashScreenScaffold extends StatefulWidget {
  const SplashScreenScaffold({Key? key}) : super(key: key);

  @override
  State<SplashScreenScaffold> createState() => _SplashScreenScaffoldState();
}

class _SplashScreenScaffoldState extends State<SplashScreenScaffold> {
  @override
  void initState() {
    super.initState();
    delayingFunc();
  }

  void delayingFunc() async {

    await Future.delayed(const Duration(seconds: 5,),);
    // NavigationHelper.pushUntil(context, const PairingPageView(),);
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light,);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          GeneralText(text: "ChatGPT", size: 30, color: Colors.white,),
        ],
      ),
    );
  }
}
