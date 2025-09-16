import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hhproject/features/jobs/data/datasources/job_remote_datasource.dart';
import 'package:hhproject/features/jobs/data/repositories/jobs_repository_impl.dart';
import 'package:hhproject/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:hhproject/features/jobs/domain/usecases/search_jobs.dart';
import 'package:hhproject/features/jobs/presentation/bloc/vacancy_bloc.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  final Dio dio = Dio();
  late final JobRemoteDatasource jobRemoteDatasource;
  late final JobsRepository jobsRepository;
  late final SearchJobs searchJobs;
  MyApp({super.key}):jobRemoteDatasource=JobRemoteDatasourceImpl(Dio()),
  searchJobs=SearchJobs(JobsRepositoryImpl(JobRemoteDatasourceImpl(Dio())));
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>JobsBloc(searchJobs));
  }
}