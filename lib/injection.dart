import 'package:advicer/application/advicer/advicer_bloc.dart';
import 'package:advicer/domain/repositories/advicer_repository.dart';
import 'package:advicer/domain/usecases/advicer_usecases.dart';
import 'package:advicer/infrastructure/repositories/advicer_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'infrastructure/datasources/advicer_remote_datasource.dart';

final sl = GetIt.I; // sl = service Locator

Future<void> init() async {
  //! blocs
  sl.registerFactory(() => AdvicerBloc(usecases: sl()));

  //! usecases
  sl.registerLazySingleton(() => AdvicerUsecases(advicerRepository: sl()));

  //! repos
  sl.registerLazySingleton<AdvicerRepository>(
      () => AdvicerRepositoryImpl(advicerRemoteDatasource: sl()));

  //! datasources
  sl.registerLazySingleton<AdvicerRemoteDatasource>(
      () => AdvicerRemoteDatasourceImpl(client: sl()));

  //! extern
  sl.registerLazySingleton(() => http.Client);
}
