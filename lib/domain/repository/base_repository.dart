import 'package:dartz/dartz.dart';
import 'package:endless/core/errors/failures.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/domain/entity/company_entity.dart';
import 'package:endless/domain/entity/log_out_entity.dart';
import 'package:endless/domain/entity/login_entity.dart';
import 'package:endless/domain/entity/offer_entity.dart';
import 'package:endless/domain/entity/register_entity.dart';
import 'package:endless/domain/entity/reservation_entity.dart';
import 'package:endless/domain/entity/user_profile_entity.dart';
import 'package:endless/domain/usecase/login_usecase.dart';
import 'package:endless/domain/usecase/register_usecase.dart';

abstract class BaseRepository{

  Future<Either<Failure,LogInEntity>> logIn(LogInParams params);

  Future<Either<Failure,RegisterEntity>> register(RegisterParams params);

  Future<Either<Failure,LogOutEntity>> logOut(NoParams params);

  Future<Either<Failure,UserProfileEntity>> userProfile(NoParams params);

  Future<Either<Failure,List<CompanyEntity>>> companies(NoParams params);

  Future<Either<Failure,List<OfferEntity>>> offers(NoParams params);

  Future<Either<Failure,CompanyEntity>> getCompanyById(int params);

  Future<Either<Failure,ReservationEntity>> addReservation(int params);
  Future<Either<Failure,List<OfferEntity>>> searchByEventId(String params);
  Future<Either<Failure,List<dynamic>>> getCompanyImages(int params);

}