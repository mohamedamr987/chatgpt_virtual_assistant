import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:chatgpt_virtual_assistant/core/errors/exceptions.dart';
import 'package:chatgpt_virtual_assistant/core/errors/failures.dart';
import 'package:chatgpt_virtual_assistant/core/helpers/dio_helper.dart';

abstract class Repository{
  
  final DioHelper dioHelper = DioHelper();

  Future<Either<Failure,ReturnType>> exceptionHandler<ReturnType> (Future<ReturnType> Function() function) async{
    try{
      return Right(await function());
    }
    catch(e, stacktrace) {
      log(e.toString());
      log(stacktrace.toString());
      return Left(ServerFailure(message: (e is ServerException)? e.toString() : "Something went wrong, please try again later."),);
    }
  }
}