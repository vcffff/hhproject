import 'package:dio/dio.dart';
import 'package:hhproject/features/jobs/data/models/vacancy_model.dart';
abstract class JobRemoteDatasource {
  Future<List<VacancyModel>>searchjobs(String query);

}


class JobRemoteDatasourceImpl implements JobRemoteDatasource{
  final Dio dioclient;
  JobRemoteDatasourceImpl(this.dioclient);
  @override
  Future<List<VacancyModel>> searchjobs(String query)async {
  final response=await dioclient.get('https://api.hh.ru/vacancies',queryParameters: {"text":query},
  options: Options(headers: { "User-Agent": "MyFlutterApp/1.0",
          "Accept": "application/json",}));
          final items=response.data['items'] as List;
          return items.map((element)=>VacancyModel.fromJson(element)).toList();
  }
  
}