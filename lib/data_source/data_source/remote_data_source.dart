import 'package:dio/dio.dart';
import 'package:endless/constant/strings.dart';
import 'package:endless/core/network/remote/api_endpoints.dart';
import 'package:endless/core/network/remote/dio_helper.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/data_source/models/company_model.dart';
import 'package:endless/data_source/models/log_out_model.dart';
import 'package:endless/data_source/models/login_model.dart';
import 'package:endless/data_source/models/offers_model.dart';
import 'package:endless/data_source/models/register_model.dart';
import 'package:endless/data_source/models/reservation_model.dart';
import 'package:endless/data_source/models/user_profile_model.dart';
import 'package:endless/domain/entity/company_entity.dart';
import 'package:endless/domain/entity/offer_entity.dart';
import 'package:endless/domain/usecase/login_usecase.dart';
import 'package:endless/domain/usecase/register_usecase.dart';

abstract class BaseRemoteDataSource{

  Future<LogInModel> logIn(LogInParams params);
  Future<RegisterModel> register(RegisterParams params);
  Future<LogOutModel> logOut(NoParams params);
  Future<UserProfileModel> userProfile(NoParams params);
  Future<List<CompanyModel>> companies(NoParams params);
  Future<List<OfferModel>> offers(NoParams params);
  Future<CompanyModel> getCompanyById(int params);
  Future<ReservationModel> addReservation(int params);
  Future<List<OfferModel>> searchByEventId(String params);
  Future<List<dynamic>> getCompanyImages(int params);

}

class RemoteDataSource implements BaseRemoteDataSource{

  final DioHelper dioHelper;


  RemoteDataSource({required this.dioHelper});

  @override
  Future<LogInModel> logIn(LogInParams params) async{
    final Response response = await dioHelper.post(url: logInEndpoint,data: {
      'email': params.email,
      'password': params.password,
    });

    return LogInModel.fromJson(response.data);
  }

  @override
  Future<RegisterModel> register(RegisterParams params) async{
    final Response response = await dioHelper.post(url: registerEndpoint,data: {
      'email': params.email,
      'phone': params.phone,
      'name': params.name,
      'password': params.password,
    });

    return RegisterModel.fromJson(response.data);
  }

  @override
  Future<LogOutModel> logOut(NoParams params) async{
    final Response response = await dioHelper.post(url: logOutEndpoint, token: token);

    return LogOutModel.fromJson(response.data);
  }

  @override
  Future<UserProfileModel> userProfile(NoParams params) async{
    final Response response = await dioHelper.get(url: userProfileEndpoint, token: token);

    return UserProfileModel.fromJson(response.data);
  }

  @override
  Future<List<CompanyModel>> companies(NoParams params) async{
    final Response response = await dioHelper.get(url: companiesEndpoint, token: token);

    return List<CompanyModel>.from(
        (response.data['companies'] as List).map((e) => CompanyModel.fromJson(e)));
  }

  @override
  Future<List<OfferModel>> offers(NoParams params) async{
    final Response response = await dioHelper.get(url: offersEndpoint, token: token);

    return List<OfferModel>.from(
        (response.data['offers'] as List).map((e) => OfferModel.fromJson(e)));
  }

  @override
  Future<CompanyModel> getCompanyById(int params) async{
    final Response response = await dioHelper.post(url: getCompanyEndpoint, token: token,data: {'id':params});

    return CompanyModel.fromJson(response.data);
  }

  @override
  Future<ReservationModel> addReservation(int params) async{
    final Response response = await dioHelper.post(url: addReservationEndpoint, token: token,data: {'offer_id':params});

    return ReservationModel.fromJson(response.data);
  }

  @override
  Future<List<OfferModel>> searchByEventId(String params) async{
    final Response response = await dioHelper.post(url: searchByEventEndpoint, token: token,data: {'event_type':params});

    return List<OfferModel>.from(
        (response.data['offers'] as List).map((e) => OfferModel.fromJson(e)));  }

  @override
  Future<List<dynamic>> getCompanyImages(int params)async {
    final Response response = await dioHelper.post(url: companyImagesEndpoint, token: token,data: {'company_id':params});

    return response.data['images'];
  }
}