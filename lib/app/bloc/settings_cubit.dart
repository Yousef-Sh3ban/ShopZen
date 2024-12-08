import 'package:base/configurations/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<AppStates>{
  SettingsCubit._internal():super(InitialState());
  static SettingsCubit instance = SettingsCubit._internal();
  //========================================
  //======================================== Variables
  //========================================
  bool isDarkMode = false;
  Locale locale = const Locale('en');
  //========================================
  //======================================== Functions
  //========================================
  void toggleDarkMode() async{
    isDarkMode = !isDarkMode;
    // TODO: save the value in shared preferences
    emit(LoadedState(isDarkMode));
  }

  void toggleLocale() async{
    if(locale.languageCode == 'en'){
      locale = const Locale('ar');
    }else{
      locale = const Locale('en');
    }
    // TODO: save the value in shared preferences
    emit(LoadedState(locale));
  }
}