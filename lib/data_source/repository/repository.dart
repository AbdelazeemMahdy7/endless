import 'package:dartz/dartz.dart';
import 'package:endless/core/errors/exceptions.dart';
import 'package:endless/core/errors/failures.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/data_source/data_source/remote_data_source.dart';
import 'package:endless/data_source/models/log_out_model.dart';
import 'package:endless/domain/entity/company_entity.dart';
import 'package:endless/domain/entity/log_out_entity.dart';
import 'package:endless/domain/entity/login_entity.dart';
import 'package:endless/domain/entity/offer_entity.dart';
import 'package:endless/domain/entity/register_entity.dart';
import 'package:endless/domain/entity/reservation_entity.dart';
import 'package:endless/domain/entity/user_profile_entity.dart';
import 'package:endless/domain/repository/base_repository.dart';
import 'package:endless/domain/usecase/login_usecase.dart';
import 'package:endless/domain/usecase/register_usecase.dart';

class Repository extends BaseRepository{

  BaseRemoteDataSource remoteDataSource;


  Repository(this.remoteDataSource);

  @override
  Future<Either<Failure, LogInEntity>> logIn(LogInParams params) async{
    try{
      final LogInEntity logInEntity = await remoteDataSource.logIn(params);
      return Right(logInEntity);
    } on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, RegisterEntity>> register(RegisterParams params) async{
    try{
      final RegisterEntity logInEntity = await remoteDataSource.register(params);
      return Right(logInEntity);
    } on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, LogOutEntity>> logOut(NoParams params) async{
    try{
      final LogOutEntity logOutEntity = await remoteDataSource.logOut(params);
      return Right(logOutEntity);
    } on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserProfileEntity>> userProfile(NoParams params) async{
    try{
      final UserProfileEntity userProfileEntity = await remoteDataSource.userProfile(params);
      return Right(userProfileEntity);
    } on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<CompanyEntity>>> companies(NoParams params) async{
    try{
      final List<CompanyEntity> companiesList = await remoteDataSource.companies(params);
      return Right(companiesList);
    } on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> offers(NoParams params) async{
    try{
      final List<OfferEntity> offersList = await remoteDataSource.offers(params);
      return Right(offersList);
    } on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, CompanyEntity>> getCompanyById(int params) async{
    try{
      final CompanyEntity companyEntity = await remoteDataSource.getCompanyById(params);
      return Right(companyEntity);
    } on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, ReservationEntity>> addReservation(int params)async {
    try{
      final ReservationEntity reservationEntity = await remoteDataSource.addReservation(params);
      return Right(reservationEntity);
    } on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> searchByEventId(String params) async{
    try{
      final List<OfferEntity> offersList = await remoteDataSource.searchByEventId(params);
      return Right(offersList);
    } on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<dynamic>>> getCompanyImages(int params)async {
    try{
      final List<dynamic> imagesList = await remoteDataSource.getCompanyImages(params);
      return Right(imagesList);
    } on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }
}