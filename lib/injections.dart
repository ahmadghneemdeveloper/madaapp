  import 'package:connectivity_plus/connectivity_plus.dart';
  import 'package:dio/dio.dart';
  import 'package:get_it/get_it.dart';
  import 'package:madaapp/core/services/network/endpoints.dart';
  import 'package:madaapp/core/services/network/network_info.dart';
  import 'package:madaapp/data/data_sourse/remote/dio/dio_client.dart';
  import 'package:madaapp/data/data_sourse/remote/dio/logging_interceptor.dart';
  import 'package:madaapp/data/provider/local_auth_provider.dart';
  import 'package:madaapp/data/repository_implemintation/auth_repository.dart';
import 'package:madaapp/data/repository_implemintation/home_repository.dart';
  import 'package:madaapp/data/repository_implemintation/local_repository_implementation/local_repository_imp.dart';
import 'package:madaapp/data/repository_implemintation/profile_repository.dart';
  import 'package:madaapp/domain/repository/authentication/authentication_repository.dart';
import 'package:madaapp/domain/repository/home/home_repository.dart';
  import 'package:madaapp/domain/repository/local_repository/local_repo.dart';
import 'package:madaapp/domain/repository/profile/profile_repository.dart';
  import 'package:madaapp/domain/use_case/authentication_use_case/login_use_case.dart';
import 'package:madaapp/domain/use_case/authentication_use_case/refresh_token_use_case.dart';
  import 'package:madaapp/domain/use_case/home/home_use_case.dart';
import 'package:madaapp/domain/use_case/local_use_cases/clear_user_data_usecase.dart';
  import 'package:madaapp/domain/use_case/local_use_cases/get_is_login_usecase.dart';
  import 'package:madaapp/domain/use_case/local_use_cases/get_user_data_usecase.dart';
import 'package:madaapp/domain/use_case/local_use_cases/save_token_usecase.dart';
  import 'package:madaapp/domain/use_case/local_use_cases/save_user_usecase.dart';
import 'package:madaapp/domain/use_case/profile/profile_use_case.dart';
  import 'package:madaapp/presentation/auth/login/view_model/login_view_model.dart';
import 'package:madaapp/presentation/home/view/view_model/home_view_model.dart';
import 'package:madaapp/presentation/profile/view/view_model/profile_view_model.dart';
import 'package:madaapp/presentation/splash/view_model/refresh_token_view_model.dart';
  import 'package:shared_preferences/shared_preferences.dart';

  //service locator
  final sl = GetIt.instance;

  Future<void> init() async {
    ///Use Case
    // local
    sl.registerLazySingleton(() => SaveTokenDataUseCase(repository: sl()));
    sl.registerLazySingleton(() => SaveUserDataUseCase(repository: sl()));
    sl.registerLazySingleton(() => ClearUserDataUseCase(repository: sl()));
    sl.registerLazySingleton(() => GetUserDataUseCase(repository: sl()));
    sl.registerLazySingleton(() => GetIsUserLoginUseCase(repository: sl()));

    //Auth
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => HomeUseCase(sl()));
    sl.registerLazySingleton(() => ProfileUseCase(sl()));

    ///View Model
    sl.registerLazySingleton(
            () => LoginViewModel(loginUseCase: sl(), saveTokenDataUseCase: sl()));
    sl.registerLazySingleton(() => HomeViewModel(
      homeUseCase: sl()));
    sl.registerLazySingleton(() => ProfileViewModel(
      profileUseCase: sl(),
    ));
    // sl.registerLazySingleton(() => RefreshTokenViewModel(
    //   refreshTokenUseCase: sl(),
    //   saveTokenDataUseCase: sl(),
    // ));


    ///Repository
    sl.registerLazySingleton<LocalRepository>(
            () => LocalRepositoryImp(sharedPreferences: sl(), dioClient: sl()));
    //
    sl.registerLazySingleton<BaseAuthenticationRepository>(
            () => AuthRepository(dioClient: sl(), sharedPreferences: sl()));
    sl.registerLazySingleton<BaseHomeRepository>(
            () => HomeRepository(sharedPreferences: sl(), dioClient: sl()));
    sl.registerLazySingleton<BaseProfileRepository>(
            () => ProfileRepository(sharedPreferences: sl(), dioClient: sl()));
    /// External
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => LoggingInterceptor());
    sl.registerLazySingleton(() => DioClient(NetworkPath.hostName,
        loggingInterceptor: sl(), sharedPreferences: sl()));

    ///SERVICES REGISTER
     sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo(sl<Connectivity>()));

    ///providers
    sl.registerLazySingleton(
          () => LocalAuthProvider(
        getIsUserLoginUseCase: sl(),
        getUserDataUseCase: sl(),
        clearUserDataUseCase: sl(),
      ),
    );
  }
