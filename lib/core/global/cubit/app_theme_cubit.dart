

import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(LightTheme());


  bool isDark = false;


  void toggleTheme(){
    isDark = !isDark;
    isDark? emit(LightTheme()): emit(DarkTheme());
  }

  
}
