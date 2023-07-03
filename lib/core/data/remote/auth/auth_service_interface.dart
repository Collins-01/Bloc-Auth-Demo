import 'package:bloc_login_demo/core/data_models/data_models.dart';

abstract class AuthService {
  /// A method to log the user in.
  Future<void> login(String username, String password);

  /// A method signout the current user of the application.
  Future<void> logout();

  /// It is used to check if the user is authenticated, it is set to false when the user is unauthenticated.
  bool get isAuthenticated;

  /// Returns an Instance of the Current User, It's set to null when the user is unauthenticated.
  User? get currentUser;
}
