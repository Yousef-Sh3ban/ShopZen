import 'package:base/configurations/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCubit extends Cubit<AppStates> {
  SettingsCubit._internal() : super(InitialState());
  static SettingsCubit instance = SettingsCubit._internal();
  //========================================
  //======================================== Variables
  //========================================
  bool isDarkMode = false;
  Locale locale = const Locale('en');
  //========================================
  //======================================== Functions
  //========================================
  void toggleDarkMode() async {
    isDarkMode = !isDarkMode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDarkMode", isDarkMode);

    emit(LoadedState(isDarkMode));
  }

  Future<void> loadThemeMode() async {
    // Load the saved theme mode from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool("isDarkMode") ?? false;

    // Emit the loaded state
    emit(LoadedState(isDarkMode));
  }
}
