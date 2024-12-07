abstract class AppEvents {}

class FetchDataEvent extends AppEvents {}

class SaveEvent extends AppEvents {
  final dynamic data;
  SaveEvent(this.data);
}

class SignupEvent extends AppEvents {
  final String name;
  final String password;
  SignupEvent(
      {required this.name, required this.password});
}class LoginEvent extends AppEvents {
  final String name;
  final String password;
  LoginEvent(
      {required this.name, required this.password});
}

class UpdateEvent extends AppEvents {
  final dynamic data;
  UpdateEvent(this.data);
}

class DeleteEvent extends AppEvents {
  final dynamic data;
  DeleteEvent(this.data);
}

class ClickEvent extends AppEvents {
  final dynamic data;
  ClickEvent({this.data});
}

class CheckboxEvent extends AppEvents {
  final bool? data;
  CheckboxEvent({required this.data});
}

class OnChangeEvent extends AppEvents {
  final String name;
  final String password;
  final String ?passwordConfirm;
  final bool? isChecked;

  OnChangeEvent({required this.name, required this.password, this.isChecked,this.passwordConfirm});
}

