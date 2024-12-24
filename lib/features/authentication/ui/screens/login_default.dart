import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:base/app/functions/vibration.dart';
import 'package:base/configurations/app_events.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/features/authentication/ui/blocs/login_bloc.dart';
import 'package:base/features/authentication/ui/widgets/custom_text_form.dart';
import 'package:base/features/authentication/ui/widgets/login.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginDefaultScreen extends StatefulWidget {
  const LoginDefaultScreen({super.key});

  @override
  State<LoginDefaultScreen> createState() => _LoginDefaultScreenState();
}

class _LoginDefaultScreenState extends State<LoginDefaultScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocConsumer<LoginBloc, AppStates>(
            listener: (context, state) {
              if (state is LoadedState) {
                triggerVibration(duration: 500);
                saveLoginStatus(true);
                const snackBar = SnackBar(
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 13),
                  duration: Duration(seconds: 10),
                  content: AwesomeSnackbarContent(
                    color: Color(0xFF452CE8),
                    title: 'Yay!',
                    messageTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    message: 'You login successfully',
                    contentType: ContentType.success,
                  ),
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.home,
                  (route) => false,
                );
              } else if (state is ErrorState) {
                const snackBar = SnackBar(
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 13),
                  duration: Duration(seconds: 10),
                  content: AwesomeSnackbarContent(
                    color: Color(0xFF452CE8),
                    title: 'Oops!',
                    messageTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    message: "Error, check your name and password",
                    contentType: ContentType.success,
                  ),
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
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
                    const Text("Login with Name",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 47,
                    ),
                    CustomTextForm(
                        onChanged: (value) {
                          context.read<LoginBloc>().add(OnChangeEvent(
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
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextForm(
                        onChanged: (value) {
                          context.read<LoginBloc>().add(
                                OnChangeEvent(
                                    name: nameController.text,
                                    password: value ?? ""),
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
                      height: 8,
                    ),
                    const Row(
                      children: [
                        Expanded(child: SizedBox()),
                        InkWell(
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    LoginBottom(
                      text: "Login",
                      color: state is ReadyToLoginState
                          ? const Color(0xFF452CE8)
                          : const Color(0xFF6A70FF),
                      ontap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginBloc>(context).add(
                            LoginEvent(
                              name: nameController.text,
                              password: passwordController.text,
                            ),
                          );
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

Future<void> saveLoginStatus(bool isLoggedIn) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', isLoggedIn);
}
