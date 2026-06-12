import '../models/user_model.dart';
import '../../../../core/utils/app_role.dart';

class AuthRepository {
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    // Mock: simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock: accept any non-empty credentials
    return UserModel(
      name: 'Utilisateur',
      email: email,
      role: AppRole.user,
    );
  }

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required AppRole role,
  }) async {
    // Mock: simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    return UserModel(
      name: name,
      email: email,
      role: role,
    );
  }
}
