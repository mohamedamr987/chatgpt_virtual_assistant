import 'package:chatgpt_virtual_assistant/constants.dart';
import 'package:chatgpt_virtual_assistant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainLayoutWidget extends StatelessWidget {
  final Widget widget;
  final Color backGroundColor;
  final ScrollController? scrollController;
  final double? minHeight;
  final bool isScrollable;
  final Future Function()? onRefresh;
  final double heightMargin;
  final double widthMargin;
  final Widget? drawer;
  final AppBar? appBar;
  final Future<bool> Function()? onWillPop;
  final bool isSafeArea;
  final SystemUiOverlayStyle systemUiOverlayColor;
  final double? maxHeight;
  final Widget? backgroundWidget;
  final Widget? floatingButton;
  final bool extendBodyBehindAppBar;
  const MainLayoutWidget({
    Key? key,
    required this.widget,
    this.backGroundColor = kBackgroundColor,
    this.scrollController,
    this.minHeight,
    this.maxHeight,
    this.isScrollable = true,
    this.heightMargin = 12.0,
    this.widthMargin = 24.0,
    this.drawer,
    this.appBar,
    this.onWillPop,
    this.isSafeArea = true,
    this.systemUiOverlayColor = SystemUiOverlayStyle.dark,
    this.onRefresh,
    this.backgroundWidget,
    this.extendBodyBehindAppBar = false,
    this.floatingButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayColor);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(

        onWillPop: onWillPop,
        child: Scaffold(
          appBar: appBar,
          drawer: drawer,

          extendBodyBehindAppBar: extendBodyBehindAppBar,
          floatingActionButton: floatingButton,
          backgroundColor: backGroundColor,
          body: backgroundWidget != null ? Stack(
            children: [
              backgroundWidget!,
              IsScrollable(
                maxHeight: maxHeight,
                onRefresh: onRefresh,
                scrollController: scrollController,
                minHeight: minHeight,
                widthMargin: widthMargin,
                heightMargin: heightMargin,
                widget: widget,
                isSafeArea: isSafeArea,
                isScrollable: isScrollable,
              ),
            ],
          ):
          IsScrollable(
            maxHeight: maxHeight,
            onRefresh: onRefresh,
            scrollController: scrollController,
            minHeight: minHeight,
            widthMargin: widthMargin,
            heightMargin: heightMargin,
            widget: widget,
            isSafeArea: isSafeArea,
            isScrollable: isScrollable,
          ),
        ),
      ),
    );
  }
}

class IsScrollable extends StatelessWidget {
  const IsScrollable({
    Key? key,
    required this.scrollController,
    required this.minHeight,
    required this.widthMargin,
    required this.heightMargin,
    required this.widget,
    required this.isSafeArea,
    required this.isScrollable,
    required this.onRefresh,
    required this.maxHeight,
  }) : super(key: key);

  final bool isScrollable;
  final ScrollController? scrollController;
  final double? minHeight;
  final double widthMargin;
  final double heightMargin;
  final Widget widget;
  final bool isSafeArea;
  final Future Function()? onRefresh;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    if (isScrollable) {
      return onRefresh != null ? RefreshIndicator(
        onRefresh: onRefresh!,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          controller: scrollController,
          child: MainBodyWidget(
            maxHeight: maxHeight,
            minHeight: minHeight,
            widthMargin: widthMargin,
            heightMargin: heightMargin,
            widget: widget,
            isSafeArea: isSafeArea,
          ),
        ),
      ) :
      SingleChildScrollView(
        padding: EdgeInsets.zero,
        controller: scrollController,
        child: MainBodyWidget(
          maxHeight: maxHeight,
          minHeight: minHeight,
          widthMargin: widthMargin,
          heightMargin: heightMargin,
          widget: widget,
          isSafeArea: isSafeArea,
        ),
      );
    } else {
      return MainBodyWidget(
        maxHeight: maxHeight,
        minHeight: minHeight,
        widthMargin: widthMargin,
        heightMargin: heightMargin,
        widget: widget,
        isSafeArea: isSafeArea,
      );
    }
  }
}

class MainBodyWidget extends StatelessWidget {
  const MainBodyWidget({
    Key? key,
    required this.minHeight,
    required this.widthMargin,
    required this.heightMargin,
    required this.widget,
    required this.isSafeArea,
    required this.maxHeight,
  }) : super(key: key);

  final double? minHeight;
  final double widthMargin;
  final double heightMargin;
  final Widget widget;
  final bool isSafeArea;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: minHeight ?? SizeConfig.screenHeight - 200,
        maxHeight: maxHeight ?? double.infinity,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: widthMargin,
      ),
      padding: EdgeInsets.symmetric(
        vertical: heightMargin,
      ),
      width: SizeConfig.screenWidth,
      child: isSafeArea
          ? SafeArea(
              child: widget,
            )
          : widget,
    );
  }
}
