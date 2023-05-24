import 'package:dartz/dartz.dart';
import 'package:endless/core/errors/failures.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/domain/entity/reservation_entity.dart';
import 'package:endless/domain/repository/base_repository.dart';

class AddReservationUseCase extends UseCase<ReservationEntity,int>{

  BaseRepository baseRepository;


  AddReservationUseCase(this.baseRepository);

  @override
  Future<Either<Failure, ReservationEntity>> call(int params) async{
    return await baseRepository.addReservation(params);
  }
}