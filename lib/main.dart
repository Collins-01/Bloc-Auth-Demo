import 'package:bloc_login_demo/core/injection_container.dart';
import 'package:bloc_login_demo/views/auth/auth.dart';
import 'package:bloc_login_demo/views/home/home.dart';
import 'package:bloc_login_demo/views/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LoginBloc(),
          child: LoginView(),
        ),
        BlocProvider(
          create: (BuildContext context) => HomeBloc(),
          child: const HomeView(),
        ),
      ],
      child: MaterialApp(
        title: 'BLOC-LOGIN-DEMO',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginView(),
      ),
    );
  }
}
