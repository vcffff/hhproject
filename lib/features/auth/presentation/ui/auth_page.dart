import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hhproject/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:hhproject/features/auth/presentation/bloc/auth_event.dart';
import 'package:hhproject/features/jobs/presentation/ui/void.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/auth_state.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<bool> _checkLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  void _login(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (email.isNotEmpty && password.isNotEmpty) {
      context.read<AuthBloc>().add(LoginRequested(email, password));
    } else {
      ShowSnack.show('Пожалуйста заполните все поля', context);
    }
  }

  void _register(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (email.isNotEmpty && password.isNotEmpty) {
      context.read<AuthBloc>().add(RegisterRequested(email, password));
    } else {
      ShowSnack.show('Пожалуйста заполните все поля', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkLoggedIn(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.data == true) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/home');
          });
          return const SizedBox.shrink();
        }
        return Scaffold(
          backgroundColor: Colors.black,
          body: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is Authenticated) {
                context.go('/home');
              } else if (state is AuthFailed) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.lock, size: 60, color: Colors.blue),
                        const SizedBox(height: 20),
                        const Text(
                          "Добро пожаловать",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Войдите в аккаунт, чтобы продолжить",
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          controller: _emailController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[900],
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            hintText: "name@example.com",
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[900],
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            hintText: "Пароль",
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () => _login(context),
                            icon: const Icon(Icons.login, color: Colors.white),
                            label: const Text(
                              "Войти",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.blue),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () => _register(context),
                            icon: const Icon(
                              Icons.person_add,
                              color: Colors.blue,
                            ),
                            label: const Text(
                              "Регистрация",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
