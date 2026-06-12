import 'package:equatable/equatable.dart';

import '../../../../core/utils/app_role.dart';

class UserModel extends Equatable {
  final String name;
  final String email;
  final AppRole role;

  const UserModel({
    required this.name,
    required this.email,
    required this.role,
  });

  @override
  List<Object?> get props => [name, email, role];
}
