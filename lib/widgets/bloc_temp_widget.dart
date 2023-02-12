import 'package:flutter/material.dart';

import '../constants.dart';
import 'general_text.dart';

class BlocTempWidget extends StatelessWidget {
  final Widget successWidget;
  final bool errorState;
  final bool loadingState;
  final Color? loadingColor;
  final Widget? loadingWidget;
  final bool? emptyState;
  final String? emptyTitle;
  final MainAxisAlignment mainAxisAlignment;
  const BlocTempWidget({Key? key, required this.successWidget, required this.errorState, required this.loadingState,  this.emptyState,  this.emptyTitle, this.loadingWidget, this.loadingColor, this.mainAxisAlignment =  MainAxisAlignment.start,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return loadingWidget!;
    if (loadingState) {
      return loadingWidget ??
           Center(
            child: CircularProgressIndicator(
              color: loadingColor??kPrimaryColor,
            ),
          );
    } else {
      return Column(
        mainAxisAlignment: errorState ? MainAxisAlignment.center : mainAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: [
          if(!errorState)
            successWidget,
          if(errorState)
            const Center(
              child: GeneralText(
                text: "Something went wrong, please try again later.",
                size: 26,
                isBold: true,
                textAlign: TextAlign.center,
                color: kPrimaryColor,
              ),
            )
          else if (emptyState != null && emptyState!)
            Center(
              child: GeneralText(
                text: "There is no ${emptyTitle!}",
                size: 26,
                isBold: true,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      );
    }
  }
}
