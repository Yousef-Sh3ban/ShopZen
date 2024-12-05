import 'dart:developer';

import 'package:base/app/widgets/fields/text_input_field.dart';
import 'package:base/configurations/app_events.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/features/authentication/ui/blocs/signup_bloc.dart';
import 'package:base/features/authentication/ui/widgets/custom_text_form.dart';
import 'package:base/features/authentication/ui/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/login_bloc.dart';

class SignupDefaultScreen extends StatefulWidget {
  const SignupDefaultScreen({super.key});

  @override
  State<SignupDefaultScreen> createState() => _SignupDefaultScreenState();
}

class _SignupDefaultScreenState extends State<SignupDefaultScreen> {
  @override
  final GlobalKey<FormState> formKey = GlobalKey();
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordConfiirmController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<SignupBloc, AppStates>(
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const Text("Signup with Name",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextForm(
                      onChanged: (value) {
                        context.read<SignupBloc>().add(
                              SignupOnChangeEvent(
                                  name: value ?? "",
                                  password: passwordController.text,
                                  passwordConfirm:
                                      passwordConfiirmController.text),
                            );
                      },
                      hint: "Enter your name",
                      title: "Name",
                      textEditingController: nameController,
                      validator: (String? name) {
                        if (name!.length < 3) {
                          return "Name must be at least 3 letter";
                        }
                        return null;
                      },
                    ),
                    CustomTextForm(
                        onChanged: (value) {
                          context.read<SignupBloc>().add(
                                SignupOnChangeEvent(
                                    name: nameController.text,
                                    password: value ?? "",
                                    passwordConfirm:
                                        passwordConfiirmController.text),
                              );
                        },
                        ispassword: true,
                        hint: "Enter your password",
                        title: "Password",
                        textEditingController: passwordController,
                        validator: (String? password) {
                          if (password!.isEmpty) {
                            return "Password can not be empty";
                          }
                          if (password.length < 8) {
                            return "Password must be at least 8 letters";
                          }
                          return null;
                        }),
                    CustomTextForm(
                        onChanged: (value) {
                          context.read<SignupBloc>().add(
                                SignupOnChangeEvent(
                                    name: nameController.text,
                                    password: passwordController.text,
                                    passwordConfirm: value ?? ""),
                              );
                        },
                        ispassword: true,
                        hint: "Enter your password",
                        title: "Confirm Password",
                        textEditingController: passwordConfiirmController,
                        validator: (String? passwordConfirm) {
                          if (passwordConfirm!=passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    LoginBottom(
                      text: "Signup",
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
