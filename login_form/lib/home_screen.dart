import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form/bloc/auth_bloc.dart';
import 'package:login_form/login_screen.dart';
import 'package:login_form/widget/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthInitial) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            if(state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            final authState = context.watch<AuthBloc>().state as AuthSuccess;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('YOU ARE SIGNED IN'),
                  Text(authState.uid),
                  const SizedBox(height: 50),
                  GradientButton(
                    title: 'Logout',
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLogoutRequested());
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
