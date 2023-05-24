import 'package:dartz/dartz.dart';
import 'package:endless/core/errors/failures.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/domain/entity/user_profile_entity.dart';
import 'package:endless/domain/repository/base_repository.dart';

class UserProfileUseCase extends UseCase<UserProfileEntity,NoParams>{

  BaseRepository baseRepository;

  UserProfileUseCase(this.baseRepository);
  @override
  Future<Either<Failure, UserProfileEntity>> call(NoParams params) async{
    return await baseRepository.userProfile(params);
  }
}