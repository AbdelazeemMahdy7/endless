import 'package:dartz/dartz.dart';
import 'package:endless/core/errors/failures.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/domain/entity/offer_entity.dart';
import 'package:endless/domain/repository/base_repository.dart';

class SearchByEventIdUseCase extends UseCase<List<OfferEntity>,String>{

  BaseRepository baseRepository;


  SearchByEventIdUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<OfferEntity>>> call(String params) async{
    return await baseRepository.searchByEventId(params);
  }
}