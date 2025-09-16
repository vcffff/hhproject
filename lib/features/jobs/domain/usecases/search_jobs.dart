import 'package:hhproject/features/jobs/domain/entities/vacancy.dart';
import 'package:hhproject/features/jobs/domain/repositories/jobs_repository.dart';

class SearchJobs {
final JobsRepository jobsRepository;
SearchJobs(this.jobsRepository);

Future<List<Vacancy>>call(String query) async{
 if(query.isEmpty){
  return [];
 }else{
  final results=await jobsRepository.searchjobs(query);
  return results.where((job)=>job.title.isNotEmpty).toList();
 }
}

}