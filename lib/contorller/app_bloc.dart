import 'package:endless/contorller/app_states.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/domain/entity/company_entity.dart';
import 'package:endless/domain/entity/offer_entity.dart';
import 'package:endless/domain/entity/reservation_entity.dart';
import 'package:endless/domain/entity/user_profile_entity.dart';
import 'package:endless/domain/usecase/add_reservation_usecase.dart';
import 'package:endless/domain/usecase/companies_usecase.dart';
import 'package:endless/domain/usecase/get_compant_images_usecase.dart';
import 'package:endless/domain/usecase/get_company_by_id_usecase.dart';
import 'package:endless/domain/usecase/log_out_usecase.dart';
import 'package:endless/domain/usecase/login_usecase.dart';
import 'package:endless/domain/usecase/offers_usecase.dart';
import 'package:endless/domain/usecase/register_usecase.dart';
import 'package:endless/domain/usecase/search_by_event_id_usecase.dart';
import 'package:endless/domain/usecase/user_profile_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Cubit<AppStates> {
  final LogInUseCase logInUseCase;
  final RegisterUseCase registerUseCase;
  final LogOutUseCase logOutUseCase;
  final UserProfileUseCase userProfileUseCase;
  final CompaniesUseCase companiesUseCase;
  final OffersUseCase offersUseCase;
  final GetCompanyByIdUseCase getCompanyByIdUseCase;
  final AddReservationUseCase addReservationUseCase;
  final SearchByEventIdUseCase searchByEventIdUseCase;
  final GetCompanyImagesUseCase getCompanyImagesUseCase;

  AppBloc({
    required this.logInUseCase,
    required this.registerUseCase,
    required this.logOutUseCase,
    required this.userProfileUseCase,
    required this.companiesUseCase,
    required this.offersUseCase,
    required this.getCompanyByIdUseCase,
    required this.addReservationUseCase,
    required this.searchByEventIdUseCase,
    required this.getCompanyImagesUseCase,
  }) : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of(context);

  void logIn(LogInParams params) async {
    emit(LogInLoadingState());

    final result = await logInUseCase(params);

    result.fold((error) {
      emit(LogInErrorState(error.toString()));
    }, (data) {
      emit(LogInSuccessState(data));
    });
  }

  void register(RegisterParams params) async {
    emit(RegisterLoadingState());

    final result = await registerUseCase(params);

    result.fold((error) {
      emit(RegisterErrorState(error.toString()));
    }, (data) {
      emit(RegisterSuccessState(data));
    });
  }

  void logOut(NoParams params) async {
    emit(LogOutLoadingState());

    final result = await logOutUseCase(params);

    result.fold((error) {
      emit(LogOutErrorState(error.toString()));
    }, (data) {
      emit(LogOutSuccessState(data));
    });
  }

  UserProfileEntity? userProfileEntity;

  void userProfile(NoParams params) async {
    emit(UserProfileLoadingState());

    final result = await userProfileUseCase(params);

    result.fold((error) {
      emit(UserProfileErrorState(error.toString()));
    }, (data) {
      userProfileEntity =data;
      emit(UserProfileSuccessState(data));
    });
  }

  List<CompanyEntity> companiesList =[];

  void getCompanies(NoParams params) async {
    emit(CompaniesLoadingState());

    final result = await companiesUseCase(params);

    result.fold((error) {
      emit(CompaniesErrorState(error.toString()));
    }, (data) {
      companiesList = data;
      emit(CompaniesSuccessState(data));
    });
  }


  List<OfferEntity> offersList = [];

  void getOffers(NoParams params) async {
    emit(OffersLoadingState());

    final result = await offersUseCase(params);

    result.fold((error) {
      emit(OffersErrorState(error.toString()));
    }, (data) {
      offersList = data;
      emit(OffersSuccessState(data));
    });
  }

  CompanyEntity? companyEntity;

  void getCompany(int id) async {
    emit(GetCompanyLoadingState());

    final result = await getCompanyByIdUseCase(id);

    result.fold((error) {
      emit(GetCompanyErrorState(error.toString()));
    }, (data) {
      companyEntity = data;
      emit(GetCompanySuccessState(data));
    });
  }


  ReservationEntity? reservationEntity;

  void addReservation(int id) async {
    emit(AddReservationLoadingState());

    final result = await addReservationUseCase(id);

    result.fold((error) {
      emit(AddReservationErrorState(error.toString()));
    }, (data) {
      reservationEntity =data;
      emit(AddReservationSuccessState(data));
    });
  }

  OfferEntity? offerEntity;

  void searchByEvent(int id) async {
    emit(SearchByEventLoadingState());

    final result = await searchByEventIdUseCase(id);

    result.fold((error) {
      emit(SearchByEventErrorState(error.toString()));
    }, (data) {
      offerEntity = data;
      emit(SearchByEventSuccessState(data));
    });
  }
  List<String> companyImages = [];
  void getCompanyImages(int id) async {
    emit(GetCompanyImagesLoadingState());

    final result = await getCompanyImagesUseCase(id);

    result.fold((error) {
      emit(GetCompanyImagesErrorState(error.toString()));
    }, (data) {
      companyImages = data;
      emit(GetCompanyImagesSuccessState());
    });
  }

}
