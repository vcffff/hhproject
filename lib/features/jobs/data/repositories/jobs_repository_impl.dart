import 'package:hhproject/features/jobs/data/datasources/job_remote_datasource.dart';
import 'package:hhproject/features/jobs/data/models/vacancy_model.dart';
import 'package:hhproject/features/jobs/domain/entities/vacancy.dart';
import 'package:hhproject/features/jobs/domain/repositories/jobs_repository.dart';

class JobsRepositoryImpl implements JobsRepository{
  final JobRemoteDatasource jobRemoteDatasource;
  JobsRepositoryImpl(this.jobRemoteDatasource);
  @override
  Future<List<Vacancy>> searchjobs(String query) async{
    final models=await jobRemoteDatasource.searchjobs(query);
   return models.map((e)=>e.toEntity()).toList();
  }
}