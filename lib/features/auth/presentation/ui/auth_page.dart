import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hhproject/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:hhproject/features/auth/presentation/bloc/auth_event.dart';
import 'package:hhproject/features/jobs/presentation/ui/void.dart';

import '../bloc/auth_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hhproject/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:hhproject/features/auth/presentation/bloc/auth_event.dart';
import 'package:hhproject/features/auth/presentation/bloc/auth_state.dart';
import 'package:hhproject/features/jobs/presentation/ui/void.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      context.read<AuthBloc>().add(LoginRequested(email, password));
    } else {
      ShowSnack.show('Please fill out all fields', context);
    }
  }

  void _register(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      context.read<AuthBloc>().add(RegisterRequested(email, password));
    } else {
      ShowSnack.show('Please fill out all fields', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Auth")),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Welcome, ${_emailController.text}")),
            );
            Navigator.pushReplacementNamed(context, "/home");
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

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _login(context),
                      child: const Text("Login"),
                    ),
                    ElevatedButton(
                      onPressed: () => _register(context),
                      child: const Text("Register"),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
