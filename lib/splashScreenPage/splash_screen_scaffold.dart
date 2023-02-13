import 'package:chatgpt_virtual_assistant/homePage/home_page_view.dart';
import 'package:chatgpt_virtual_assistant/widgets/general_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/helpers/navigation_helper.dart';
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

    await Future.delayed(const Duration(seconds: 2,),);
    NavigationHelper.pushUntil(context, const HomePageView(),);
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light,);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(width: double.infinity,),
          GeneralText(text: "Jojo", size: 30, color: Colors.white,),
          GeneralText(text: "Powered by openAI", size: 12, color: Colors.white,),
        ],
      ),
    );
  }
}
