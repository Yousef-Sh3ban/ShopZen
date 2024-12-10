import 'dart:developer';

import 'package:base/configurations/app_events.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/features/authentication/ui/widgets/custom_text_form.dart';
import 'package:base/features/authentication/ui/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/login_bloc.dart';

class LoginDefaultScreen extends StatefulWidget {
  const LoginDefaultScreen({super.key});

  @override
  State<LoginDefaultScreen> createState() => _LoginDefaultScreenState();
}

class _LoginDefaultScreenState extends State<LoginDefaultScreen> {
  @override
  final GlobalKey<FormState> formKey = GlobalKey();
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<LoginBloc, AppStates>(
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const Text("Login with Name",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextForm(
                        onChanged: (value) {
                          context.read<LoginBloc>().add(LoginOnChangeEvent(
                              name: value ?? "",
                              password: passwordController.text));
                        },
                        hint: "Enter your name",
                        title: "Name",
                        textEditingController: nameController,
                        validator: (String? name) {
                          if (name!.length < 3) {
                            return "Name must be at least 3 letter";
                          }
                          return null;
                        }),
                    CustomTextForm(
                        onChanged: (value) {
                          context.read<LoginBloc>().add(LoginOnChangeEvent(
                              name: nameController.text,
                              password: value ?? ""));
                        },
                        ispassword: true,
                        hint: "Enter your password",
                        title: "Password",
                        textEditingController: passwordController,
                        validator: (String? email) {
                          if (email!.isEmpty) {
                            return "Password can not be empty";
                          }
                          if (email.length < 8) {
                            return "Password must be at least 8 letters";
                          }
                          return null;
                        }),
                    const Row(
                      children: [
                        Expanded(child: SizedBox()),
                        Text("Forgot Password",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500))
                      ],
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    LoginBottom(
                      text: "login",
                      color: state is ReadyToLoginState
                          ? const Color(0xFF452CE8)
                          : const Color(0xFF6A70FF),
                      ontap: () {
                        formKey.currentState!.validate();
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
