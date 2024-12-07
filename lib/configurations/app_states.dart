abstract class AppStates {}

class InitialState extends AppStates {}

class LoadingState extends AppStates {}

class SuccessState extends AppStates {}

class LoadedState extends AppStates {
  final dynamic data;
  LoadedState(this.data);
}

class EmptyState extends AppStates {}

class ReadyToLoginState extends AppStates {}

class NotReadyToLoginState extends AppStates {}

class ErrorState extends AppStates {
  final String errorMessage;
  ErrorState(this.errorMessage);

  String? get error => null;
}
