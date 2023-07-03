import 'package:bloc_login_demo/views/auth/auth.dart';
import 'package:bloc_login_demo/views/home/home_bloc.dart';
import 'package:bloc_login_demo/views/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is LoggingOutComplete) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => LoginView()),
                    (route) => false);
              }
            },
            child: IconButton(
              onPressed: () {
                homeBloc.logout();
              },
              icon: (homeBloc.state is! LoggingOut)
                  ? const Icon(Icons.logout)
                  : const CircularProgressIndicator(
                      color: Colors.green,
                    ),
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          "Hey ${homeBloc.user?.name ?? ''}!!",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
