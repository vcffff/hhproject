import 'package:bloc/bloc.dart';
import 'package:hhproject/features/jobs/domain/usecases/search_jobs.dart';
import 'package:hhproject/features/jobs/presentation/bloc/vacancy_event.dart';
import 'package:hhproject/features/jobs/presentation/bloc/vacancy_state.dart';

class JobsBloc extends Bloc<JobsEvent,JobsState>{
  final SearchJobs searchJobs;
  JobsBloc(this.searchJobs):super(JobsInitial()){
    on<SearchJobsEvent>((event, emit) async {
      emit(JobsLoading());
      try{
        final response=await searchJobs.call(event.query); 
        emit(JobsLoaded(response));
      }catch(e){
        emit(JobsError(e.toString()));
      }
    },);
  }
}