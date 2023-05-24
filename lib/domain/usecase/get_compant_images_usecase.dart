import 'package:dartz/dartz.dart';
import 'package:endless/core/errors/failures.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/domain/repository/base_repository.dart';

class GetCompanyImagesUseCase extends UseCase<List<String>,int>{

  BaseRepository baseRepository;


  GetCompanyImagesUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<String>>> call(int params) async{
    return await baseRepository.getCompanyImages(params);
  }
}