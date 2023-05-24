import 'package:dartz/dartz.dart';
import 'package:endless/core/errors/failures.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/domain/entity/offer_entity.dart';
import 'package:endless/domain/repository/base_repository.dart';

class OffersUseCase extends UseCase<List<OfferEntity>,NoParams>{

  BaseRepository baseRepository;


  OffersUseCase(this.baseRepository);
  @override
  Future<Either<Failure, List<OfferEntity>>> call(NoParams params)async {
    return await baseRepository.offers(params);
  }

}