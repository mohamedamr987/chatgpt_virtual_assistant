import 'package:chatgpt_virtual_assistant/core/errors/failures.dart';
import 'package:chatgpt_virtual_assistant/core/repo/repo.dart';
import 'package:dartz/dartz.dart';

class OpenAiRepo extends Repository {
  List<String> openAiModels = ["text-ada-001", "text-davinci-003"];
  Future<Either<Failure, String>> getOpenAiResponse(String questions) async {
    return await exceptionHandler(
      () async {
        final response = await dioHelper.postData("completions", {
          "model": openAiModels[1],
          "prompt": questions,
          "temperature": 0.7,
          "max_tokens": 1024,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0
        });
        String result = response["choices"][0]["text"];
        print(result);
        if(result.contains("\n")) {
          result = result.substring(result.indexOf("\n"), result.length);
        }
        return result;
      },
    );
  }
}