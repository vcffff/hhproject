
abstract class JobsEvent {}
class SearchJobsEvent extends JobsEvent {
  final String query;
  SearchJobsEvent(this.query);
}
