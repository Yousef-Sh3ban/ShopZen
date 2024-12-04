import 'dart:developer';

import 'package:base/app/widgets/fields/text_input_field.dart';
import 'package:base/configurations/app_events.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/features/authentication/ui/widgets/login.dart';
import 'package:base/features/authentication/ui/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              const Text("Login with Email",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 24,
              ),
              CustomTextInputField(
                title: 'Email',
                hint: 'Enter your email ',
                textEditingController: emailController,
              ),
              CustomTextInputField(
                title: 'Password',
                hint: 'Enter your Password',
                textEditingController: passwordController,
              ),
              const Row(
                children: [
                  Expanded(child: SizedBox()),
                  Text("Forgot Password",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              const LoginBottom(
                text: "login",
                color: Color(0xFF6A70FF),
              )
            ],
          ),
        ),
      ),
    );
  }
}
