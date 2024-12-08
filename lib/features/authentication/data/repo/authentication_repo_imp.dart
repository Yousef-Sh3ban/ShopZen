import 'dart:developer';

import 'package:base/features/authentication/domain/models/login_response.dart';
import 'package:base/features/authentication/domain/models/register_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repo/authentication_repo_interface.dart';

class AuthenticationRepoImp implements AuthenticationRepoInterface {
  @override
  Future<LoginRequestResponse> login(String email, String password) async{
    UserCredential response = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    log(response.user!.uid.toString());
    return LoginRequestResponse(userId: response.user!.uid, message: "Login Successful");
  }

  @override
  Future<RegisterRequestResponse> register(String email, String password) async{
    return RegisterRequestResponse(success: true, message: "Login Successful");
  }
}