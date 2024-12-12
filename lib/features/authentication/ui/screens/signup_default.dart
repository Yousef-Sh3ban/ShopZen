import 'package:base/configurations/app_events.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/features/authentication/ui/widgets/custom_text_form.dart';
import 'package:base/features/authentication/ui/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/signup_bloc.dart';

class SignupDefaultScreen extends StatefulWidget {
  const SignupDefaultScreen({super.key});

  @override
  State<SignupDefaultScreen> createState() => _SignupDefaultScreenState();
}

class _SignupDefaultScreenState extends State<SignupDefaultScreen> {
  bool isChecked = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordConfiirmController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocConsumer<SignupBloc, AppStates>(
            listener: (context, state) {
              if (state is LoadedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("User registered successfully"),
                  ),
                );
              } else if (state is ErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                  ),
                );
              }
            },
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
                              OnChangeEvent(
                                name: value ?? "",
                                password: passwordController.text,
                                passwordConfirm:
                                    passwordConfiirmController.text,
                                isChecked: isChecked,
                              ),
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
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextForm(
                        onChanged: (value) {
                          context.read<SignupBloc>().add(
                                OnChangeEvent(
                                  name: nameController.text,
                                  password: value ?? "",
                                  passwordConfirm:
                                      passwordConfiirmController.text,
                                  isChecked: isChecked,
                                ),
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
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextForm(
                        onChanged: (value) {
                          context.read<SignupBloc>().add(
                                OnChangeEvent(
                                  name: nameController.text,
                                  password: passwordController.text,
                                  passwordConfirm: value ?? "",
                                  isChecked: isChecked,
                                ),
                              );
                        },
                        ispassword: true,
                        hint: "Enter your password",
                        title: "Confirm Password",
                        textEditingController: passwordConfiirmController,
                        validator: (String? passwordConfirm) {
                          if (passwordConfirm != passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    Transform.translate(
                      offset: const Offset(-10, 0),
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: const Color(0xFF452CE8),
                            side: const BorderSide(
                                width: 1.5, color: Color(0xFF141B34)),
                            value: isChecked,
                            onChanged: (val) {
                              BlocProvider.of<SignupBloc>(context)
                                  .add(CheckboxEvent(data: val));
                              isChecked = val!;
                              context.read<SignupBloc>().add(
                                    OnChangeEvent(
                                      name: nameController.text,
                                      password: passwordController.text,
                                      passwordConfirm:
                                          passwordConfiirmController.text,
                                      isChecked: isChecked,
                                    ),
                                  );
                            },
                          ),
                          const Text(
                            "Agree with ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Text(
                            "Terms & Condition",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF452CE8)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    LoginBottom(
                      text: "Signup",
                      color: SignupBloc.readyToGo
                          ? const Color(0xFF452CE8)
                          : const Color(0xFF6A70FF),
                      ontap: () {
                        if (!SignupBloc.readyToGo) {
                          if (!isChecked) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Please accept the terms and conditions"),
                              ),
                            );
                          } else {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<SignupBloc>(context).add(
                                SignupEvent(
                                  name: nameController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          }
                        }
                      },
                      child: state is LoadingState
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : null,
                    ),
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
