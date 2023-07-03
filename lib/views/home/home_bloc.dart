import 'package:bloc_login_demo/core/data/remote/auth/auth_service_interface.dart';
import 'package:bloc_login_demo/core/data_models/user_model.dart';
import 'package:bloc_login_demo/core/injection_container.dart';
import 'package:bloc_login_demo/views/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<HomeState> {
  final AuthService _authService = locator();
  HomeBloc() : super(HomeInitial());

  User? get user => _authService.currentUser;
  logout() async {
    emit(LoggingOut());
    await _authService.logout();
    emit(LoggingOutComplete());
  }
}
