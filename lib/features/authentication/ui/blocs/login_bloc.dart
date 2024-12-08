import 'dart:developer';

import 'package:base/configurations/app_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../configurations/app_events.dart';
import '../../../../configurations/app_states.dart';

class LoginBloc extends Bloc<AppEvents, AppStates> {
  LoginBloc() : super(InitialState()) {
    on<OnChangeEvent>(readyToLogin);
    on<LoginEvent>(login);
  }
  //==================================
  //================================== Functions
  //==================================
  Future<String> sendDateToApi(LoginEvent event) async {
    Dio dio = Dio();
    Response response = await dio.post(
      AppEndpoints.login,
      data: {
        "username": event.name,
        "password": event.password,
      },
    );
    log(response.toString());
    return response.toString();
  }

  //==================================
  //================================== Events
  //==================================

  void login(LoginEvent event, Emitter emit) async {
    emit(LoadingState());
    try {
      String response = await sendDateToApi(event);
      emit(LoadedState(response));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void readyToLogin(OnChangeEvent event, Emitter emit) {
    if (event.name.length > 2 && event.password.length > 7) {
      emit(ReadyToLoginState());
    } else {
      emit(NotReadyToLoginState());
    }
  }
}
