import 'package:chatgpt_virtual_assistant/constants.dart';
import 'package:flutter/material.dart';

import 'splashScreenPage/splash_screen_scaffold.dart';


final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryIconTheme: const IconThemeData(color: kPrimaryColor,),
      ),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        return ScrollConfiguration(
          behavior: const ScrollBehaviorModified(),
          child: widget!,
        );
      },
      home: const SplashScreenScaffold(),
    ),
  );
}


class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const  ClampingScrollPhysics();
  }
}