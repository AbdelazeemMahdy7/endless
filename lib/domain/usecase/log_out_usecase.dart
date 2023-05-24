import 'package:dartz/dartz.dart';
import 'package:endless/core/errors/failures.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/domain/entity/log_out_entity.dart';
import 'package:endless/domain/repository/base_repository.dart';

class LogOutUseCase extends UseCase<LogOutEntity,NoParams>{

  BaseRepository baseRepository;


  LogOutUseCase(this.baseRepository);

  @override
  Future<Either<Failure, LogOutEntity>> call(NoParams params) async{
    return await baseRepository.logOut(params);
  }
}