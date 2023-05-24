import 'package:dartz/dartz.dart';
import 'package:endless/core/errors/failures.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/domain/entity/login_entity.dart';
import 'package:endless/domain/repository/base_repository.dart';

class LogInUseCase extends UseCase<LogInEntity,LogInParams>{

  BaseRepository baseRepository;


  LogInUseCase(this.baseRepository);

  @override
  Future<Either<Failure, LogInEntity>> call(LogInParams params) async{
    return await baseRepository.logIn(params);
  }
}


class LogInParams{
  String email;
  String password;

  LogInParams({required this.email,required this.password});


}