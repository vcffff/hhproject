import 'package:hhproject/features/jobs/domain/entities/vacancy.dart';

abstract class JobsRepository {
  Future<List<Vacancy>>searchjobs(String query);
}