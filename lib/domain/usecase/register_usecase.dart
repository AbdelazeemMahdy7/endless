import 'package:dartz/dartz.dart';
import 'package:endless/core/errors/failures.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/domain/entity/register_entity.dart';
import 'package:endless/domain/repository/base_repository.dart';

class RegisterUseCase extends UseCase<RegisterEntity,RegisterParams>{

  BaseRepository baseRepository;

  RegisterUseCase(this.baseRepository);

  @override
  Future<Either<Failure, RegisterEntity>> call(RegisterParams params) async{
    return await baseRepository.register(params);
  }
}


class RegisterParams{

  String name;
  String email;
  String phone;
  String password;

  RegisterParams({required this.name,required this.email,required this.phone,required this.password});
}