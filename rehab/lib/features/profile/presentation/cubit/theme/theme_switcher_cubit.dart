import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitcherCubit extends Cubit<bool> {
  ThemeSwitcherCubit() : super(true);

  void toggle() {
    emit(!state);
  }
}
