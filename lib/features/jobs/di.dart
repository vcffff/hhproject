import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hhproject/features/auth/data/datasources/auth_datasources.dart';
import 'package:hhproject/features/auth/data/repositories/auth_impl_repository.dart';
import 'package:hhproject/features/auth/domain/repositories/auth_repository.dart';
import 'package:hhproject/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:hhproject/features/jobs/data/datasources/job_remote_datasource.dart';
import 'package:hhproject/features/jobs/data/repositories/jobs_repository_impl.dart';
import 'package:hhproject/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:hhproject/features/jobs/domain/usecases/search_jobs.dart';

final getIt = GetIt.instance;
void setupDi() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<JobRemoteDatasource>(
    () => JobRemoteDatasourceImpl(getIt<Dio>()),
  );
  getIt.registerLazySingleton<JobsRepository>(
    () => JobsRepositoryImpl(getIt<JobRemoteDatasource>()),
  );
  getIt.registerLazySingleton<SearchJobs>(
    () => SearchJobs(getIt<JobsRepository>()),
  );
  getIt.registerLazySingleton<AuthDatasources>(()=>AuthDatasources());
  getIt.registerLazySingleton<AuthRepository>(()=>AuthImplRepository(getIt<AuthDatasources>()));
  getIt.registerLazySingleton<AuthBloc>(()=>AuthBloc(getIt<AuthRepository>()));
}
