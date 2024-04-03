import 'package:flutter/material.dart';
import 'package:login_form/bloc/auth_bloc.dart';
import 'package:login_form/bloc_observer/bloc_observer.dart';
import 'package:login_form/login_screen.dart';
import 'package:login_form/pallete.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Pallete.backgroundColor),
        home: const LoginScreen(),
      ),
    );
  }
}

