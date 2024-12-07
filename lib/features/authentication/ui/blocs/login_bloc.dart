import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../configurations/app_events.dart';
import '../../../../configurations/app_states.dart';

class LoginBloc extends Bloc<AppEvents, AppStates> {
  LoginBloc() : super(InitialState()) {
    on<OnChangeEvent>(readyToLogin);
  }
  //==================================
  //================================== Events
  //==================================
  
  void readyToLogin(OnChangeEvent event, Emitter emit) {
    if (event.name.length > 2 && event.password.length > 7) {
      emit(ReadyToLoginState());
    }
     else {
      emit(NotReadyToLoginState());
    }
  }
}
