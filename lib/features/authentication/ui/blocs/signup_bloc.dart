import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configurations/app_events.dart';
import '../../../../configurations/app_states.dart';

class SignupBloc extends Bloc<AppEvents, AppStates> {
  SignupBloc() : super(InitialState()) {
    on<SignupOnChangeEvent>(readyToSignup);
  }
  //==================================
  //================================== Variables
  //==================================
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //==================================
  //================================== Functions
  //==================================
  // _login(String email,String password) async{
  //   await authenticationRepo.register(email, password);
  // }

  //==================================
  //================================== Events
  //==================================
  void readyToSignup(SignupOnChangeEvent event, Emitter emit) {
    if (event.name.length > 2 && event.password.length > 7&&event.passwordConfirm.length > 7) {
      emit(ReadyToLoginState());
    }
     else {
      emit(NotReadyToLoginState());
    }
  }
}
