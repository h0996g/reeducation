import 'package:equatable/equatable.dart';

import '../../core/utils/app_role.dart';

class MainState extends Equatable {
  final AppRole role;

  const MainState({this.role = AppRole.user});

  MainState copyWith({AppRole? role}) => MainState(role: role ?? this.role);

  @override
  List<Object?> get props => [role];
}
