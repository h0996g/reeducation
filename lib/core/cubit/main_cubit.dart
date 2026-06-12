import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_role.dart';
import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  void setRole(AppRole role) => emit(state.copyWith(role: role));
}
