import 'package:dartz/dartz.dart';
import 'package:chatgpt_virtual_assistant/widgets/show_loading.dart';
import 'package:chatgpt_virtual_assistant/widgets/snack_bar_shower.dart';

import 'failures.dart';

void requestAndFailureHandler(Future<Either<Failure, void>> Function() request, void Function() onSuccess) async {
  showLoading();
  final result = await request();
  hideLoading();
  result.fold(
    (l) => snackBarShower( l.message??"Something wrong please try again later."),
    (r) => onSuccess(),
  );
}