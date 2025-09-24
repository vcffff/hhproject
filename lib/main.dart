import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hhproject/features/auth/domain/repositories/auth_repository.dart';
import 'package:hhproject/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:hhproject/features/jobs/domain/usecases/search_jobs.dart';
import 'package:hhproject/features/jobs/presentation/bloc/vacancy_bloc.dart';
import 'package:hhproject/features/jobs/presentation/bloc/vacancy_event.dart';
import 'package:hhproject/features/jobs/presentation/bloc/vacancy_state.dart';
import 'package:hhproject/features/jobs/presentation/ui/void.dart';
import 'package:hhproject/firebase_options.dart';
import 'package:hhproject/shared/di/injection.dart';
import 'package:hhproject/shared/navigation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupDi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => JobsBloc(getIt<SearchJobs>())),
        BlocProvider(create: (_) => AuthBloc(getIt<AuthRepository>())),
      ],

      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void _onsearch(BuildContext context, String query, String text) {
    if (text.isEmpty) {
      ShowSnack.show('Error fill it out', context);
    }
    context.read<JobsBloc>().add(SearchJobsEvent(query));
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Find your dream job",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: "Type your profession...",
                        prefixIcon: const Icon(
                          Icons.work_outline,
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () =>
                          _onsearch(context, controller.text, controller.text),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              BlocConsumer<JobsBloc, JobsState>(
                listener: (context, state) {
                  if (state is JobsError) {
                    ShowSnack.show(state.message, context);
                  }
                },
                builder: (context, state) {
                  if (state is JobsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is JobsLoaded) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.vacancies.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              state.vacancies[index].title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
