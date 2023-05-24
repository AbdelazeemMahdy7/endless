import 'package:dartz/dartz.dart';
import 'package:endless/core/errors/failures.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/domain/entity/company_entity.dart';
import 'package:endless/domain/repository/base_repository.dart';

class GetCompanyByIdUseCase extends UseCase<CompanyEntity,int>{

  BaseRepository baseRepository;


  GetCompanyByIdUseCase(this.baseRepository);
  @override
  Future<Either<Failure, CompanyEntity>> call(int params) async{
    return await baseRepository.getCompanyById(params);
  }
}

