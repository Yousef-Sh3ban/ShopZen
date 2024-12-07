abstract class AppEvents {}

class FetchDataEvent extends AppEvents {}

class SaveEvent extends AppEvents {
  final dynamic data;
  SaveEvent(this.data);
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

class GetDataEvent extends AppEvents {
  final dynamic data;

  GetDataEvent({required this.data});
}

class LoginOnChangeEvent extends AppEvents {
  final String name;
  final String password;

  LoginOnChangeEvent({required this.name, required this.password});
}

class SignupOnChangeEvent extends AppEvents {
  final String name;
  final String password;
  final String passwordConfirm;

  SignupOnChangeEvent(
      {required this.passwordConfirm,
      required this.name,
      required this.password});
}
