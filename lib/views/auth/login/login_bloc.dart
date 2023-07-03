import 'package:bloc_login_demo/core/data/remote/auth/auth_service_interface.dart';
import 'package:bloc_login_demo/core/injection_container.dart';
import 'package:bloc_login_demo/views/auth/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Cubit<LoginState> {
  //* Instance of the AuthService
  final AuthService _authService = locator();
  LoginBloc() : super(LoginInitial());

  void login(String username, String password) async {
    try {
      emit(LoginLoading());
      await _authService.login(username, password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
