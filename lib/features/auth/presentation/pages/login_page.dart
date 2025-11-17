import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/auth_bloc.dart';
import 'microsoft_login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> _startLogin(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const MicrosoftLoginPage(),
      ),
    );

    if (result is Map) {
      final code = result["code"] as String?;

      if (code != null) {
        context.read<AuthBloc>().add(
          LoginWithMicrosoftEvent(code),
        );
      }
    }
  }





  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedIn) {
          context.go('/projects');
        }
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Logowanie")),
        body: Center(
          child: ElevatedButton(
            onPressed: () => _startLogin(context),
            child: const Text("Zaloguj się z Microsoft"),
          ),
        ),
      ),
    );
  }
}
