import 'package:endless/contorller/app_bloc.dart';
import 'package:endless/core/network/local/cache_helper.dart';
import 'package:endless/core/network/remote/dio_helper.dart';
import 'package:endless/data_source/data_source/remote_data_source.dart';
import 'package:endless/data_source/repository/repository.dart';
import 'package:endless/domain/repository/base_repository.dart';
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
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerLazySingleton<AppBloc>(() => AppBloc(
        logInUseCase: sl(),
        registerUseCase: sl(),
        logOutUseCase: sl(),
        addReservationUseCase: sl(),
        companiesUseCase: sl(),
        getCompanyByIdUseCase: sl(),
        getCompanyImagesUseCase: sl(),
        offersUseCase: sl(),
        searchByEventIdUseCase: sl(),
        userProfileUseCase: sl(),
      ));

  //UseCase

  sl.registerLazySingleton<LogInUseCase>(() => LogInUseCase(sl()));
  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
  sl.registerLazySingleton<AddReservationUseCase>(
      () => AddReservationUseCase(sl()));
  sl.registerLazySingleton<CompaniesUseCase>(() => CompaniesUseCase(sl()));
  sl.registerLazySingleton<GetCompanyImagesUseCase>(
      () => GetCompanyImagesUseCase(sl()));
  sl.registerLazySingleton<GetCompanyByIdUseCase>(
      () => GetCompanyByIdUseCase(sl()));
  sl.registerLazySingleton<OffersUseCase>(() => OffersUseCase(sl()));
  sl.registerLazySingleton<SearchByEventIdUseCase>(
      () => SearchByEventIdUseCase(sl()));
  sl.registerLazySingleton<LogOutUseCase>(() => LogOutUseCase(sl()));
  sl.registerLazySingleton<UserProfileUseCase>(() => UserProfileUseCase(sl()));

  //Repository

  sl.registerLazySingleton<BaseRepository>(() => Repository(sl()));

  //Datasource

  sl.registerLazySingleton<BaseRemoteDataSource>(
      () => RemoteDataSource(dioHelper: sl()));

  // Core
  sl.registerLazySingleton<DioHelper>(
    () => DioImpl(),
  );

  sl.registerLazySingleton<CacheHelper>(
    () => CacheImpl(
      sl(),
    ),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
