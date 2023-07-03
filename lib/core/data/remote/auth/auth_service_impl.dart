import 'package:bloc_login_demo/core/data_models/user_model.dart';

import 'auth_service_interface.dart';

class AuthServiceImpl implements AuthService {
  User? _user;

  bool _isAuthenticated = false;
  @override
  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    _user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      name: 'John',
    );
    _isAuthenticated = true;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 2));
    _isAuthenticated = false;
    _user = null;
  }

  @override
  User? get currentUser => _user;

  @override
  bool get isAuthenticated => _isAuthenticated;
}
