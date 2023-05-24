import 'package:dartz/dartz.dart';
import 'package:endless/core/errors/failures.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/domain/entity/company_entity.dart';
import 'package:endless/domain/repository/base_repository.dart';

class CompaniesUseCase extends UseCase<List<CompanyEntity>,NoParams>{

  BaseRepository baseRepository;


  CompaniesUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<CompanyEntity>>> call(params) async{
    return await baseRepository.companies(params);
  }
}