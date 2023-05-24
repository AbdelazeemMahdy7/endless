import 'package:endless/domain/entity/company_entity.dart';
import 'package:endless/domain/entity/log_out_entity.dart';
import 'package:endless/domain/entity/login_entity.dart';
import 'package:endless/domain/entity/offer_entity.dart';
import 'package:endless/domain/entity/register_entity.dart';
import 'package:endless/domain/entity/reservation_entity.dart';
import 'package:endless/domain/entity/user_profile_entity.dart';

abstract class AppStates{}
class AppInitialState extends AppStates{}
class LogInLoadingState extends AppStates{}
class LogInSuccessState extends AppStates{
  LogInEntity logInEntity;

  LogInSuccessState(this.logInEntity);
}
class LogInErrorState extends AppStates{
  String error;

  LogInErrorState(this.error);
}

class RegisterLoadingState extends AppStates{}
class RegisterSuccessState extends AppStates{
  RegisterEntity registerEntity;

  RegisterSuccessState(this.registerEntity);
}
class RegisterErrorState extends AppStates{
  String error;

  RegisterErrorState(this.error);
}

class LogOutLoadingState extends AppStates{}
class LogOutSuccessState extends AppStates{
  LogOutEntity logOutEntity;

  LogOutSuccessState(this.logOutEntity);
}
class LogOutErrorState extends AppStates{
  String error;

  LogOutErrorState(this.error);
}

class UserProfileLoadingState extends AppStates{}
class UserProfileSuccessState extends AppStates{
  UserProfileEntity userProfileEntity;

  UserProfileSuccessState(this.userProfileEntity);
}
class UserProfileErrorState extends AppStates{
  String error;

  UserProfileErrorState(this.error);
}

class CompaniesLoadingState extends AppStates{}
class CompaniesSuccessState extends AppStates{
  List<CompanyEntity> companiesList;

  CompaniesSuccessState(this.companiesList);
}
class CompaniesErrorState extends AppStates{
  String error;

  CompaniesErrorState(this.error);
}


class OffersLoadingState extends AppStates{}
class OffersSuccessState extends AppStates{
  List<OfferEntity> offersList;

  OffersSuccessState(this.offersList);
}
class OffersErrorState extends AppStates{
  String error;

  OffersErrorState(this.error);
}

class GetCompanyLoadingState extends AppStates{}
class GetCompanySuccessState extends AppStates{
  CompanyEntity companyEntity;

  GetCompanySuccessState(this.companyEntity);
}
class GetCompanyErrorState extends AppStates{
  String error;

  GetCompanyErrorState(this.error);
}

class AddReservationLoadingState extends AppStates{}
class AddReservationSuccessState extends AppStates{
  ReservationEntity reservationEntity;

  AddReservationSuccessState(this.reservationEntity);
}
class AddReservationErrorState extends AppStates{
  String error;

  AddReservationErrorState(this.error);
}

class SearchByEventLoadingState extends AppStates{}
class SearchByEventSuccessState extends AppStates{
  OfferEntity offerEntity;

  SearchByEventSuccessState(this.offerEntity);
}
class SearchByEventErrorState extends AppStates{
  String error;

  SearchByEventErrorState(this.error);
}

class GetCompanyImagesLoadingState extends AppStates{}
class GetCompanyImagesSuccessState extends AppStates{

}
class GetCompanyImagesErrorState extends AppStates{
  String error;

  GetCompanyImagesErrorState(this.error);
}