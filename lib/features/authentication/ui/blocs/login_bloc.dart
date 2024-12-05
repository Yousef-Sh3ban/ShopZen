import 'dart:developer';

import 'package:base/features/authentication/data/repo/authentication_repo_imp.dart';
import 'package:base/features/authentication/domain/repo/authentication_repo_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configurations/app_events.dart';
import '../../../../configurations/app_states.dart';

class LoginBloc extends Bloc<AppEvents, AppStates> {
  //==================================
  //================================== Variables
  //==================================
  bool isUsernameValid = false;
  bool isPasswordValid = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginBloc() : super(InitialState()) {
    on<LoginOnChangeEvent>(readyToLogin);
  }
  // AuthenticationRepoInterface authenticationRepo = AuthenticationRepoImp();

  //==================================
  //================================== Functions
  //==================================
  bool? _usernameValidator(String name) {
    if (name.contains('@') && name.length > 4) {
      isUsernameValid = true;
    }
    if (isPasswordValid && isUsernameValid) {
      //code to make login Clickable
      return true;
    }
  }

  bool? _passwordValidator(String name) {
    if (name.length > 8) {
      isPasswordValid = true;
    }
    if (isPasswordValid && isUsernameValid) {
      return true;
      //code to make login Clickable
    }
  }

  // _login(String email,String password) async{
  //   await authenticationRepo.register(email, password);

  // }
  //==================================
  //================================== Events
  //==================================
  void readyToLogin(LoginOnChangeEvent event, Emitter emit) {
    if (event.name.length > 2 && event.password.length > 7) {
      emit(ReadyToLoginState());
    }
     else {
      emit(NotReadyToLoginState());
    }
  }
}
