import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/home_page_scaffold.dart';
import 'controller.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageController(),
      child: const HomePageScaffold(),
    );
  }
}
