
import '../../domain/entities/vacancy.dart';

abstract class JobsState {}
class JobsInitial extends JobsState {}
class JobsLoading extends JobsState {}
class JobsLoaded extends JobsState {
  final List<Vacancy> vacancies;
  JobsLoaded(this.vacancies);
}
class JobsError extends JobsState {
  final String message;
  JobsError(this.message);
}
