abstract class Failure{
  String? message;
  Failure({this.message});
}

class ServerFailure extends Failure{
  ServerFailure({super.message,});
}

class ClientFailure extends Failure{
  ClientFailure({super.message,});
}