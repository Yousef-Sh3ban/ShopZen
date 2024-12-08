import 'package:base/configurations/app_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../configurations/app_events.dart';
import '../../../../configurations/app_states.dart';

class SignupBloc extends Bloc<AppEvents, AppStates> {
  SignupBloc() : super(InitialState()) {
    on<OnChangeEvent>(readyToLogin);
    on<SignupEvent>(signup);
    on<CheckboxEvent>(toggleCheckBox);
  }
  //==================================
  //================================== Variables
  //==================================
  static bool readyToGo = false;

  //==================================
  //================================== Functions
  //==================================
  Future<String> sendDateToApi(SignupEvent event) async {
    Dio dio = Dio();
    Response response = await dio.post(
      AppEndpoints.register,
      data: {
        "name": event.name,
        "password": event.password,
      },
    );
    return response.toString();
  }

  //==================================
  //================================== Events
  //==================================
  void readyToLogin(OnChangeEvent event, Emitter emit) {
    if (event.name.length > 2 &&
        event.password.length > 7 &&
        event.password == event.passwordConfirm &&
        event.isChecked!) {
      readyToGo = true;
      emit(ReadyToLoginState());
    } else {
      readyToGo = false;
      emit(NotReadyToLoginState());
    }
  }

  void toggleCheckBox(CheckboxEvent event, Emitter emit) {
    emit(EmptyState());
  }

  void signup(SignupEvent event, Emitter emit) async {
    emit(LoadingState());
    try {
      String response = await sendDateToApi(event);
      emit(LoadedState(response));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
