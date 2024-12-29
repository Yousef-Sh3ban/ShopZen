import 'package:animate_do/animate_do.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:base/app/bloc/settings_cubit.dart';
import 'package:base/configurations/app_theme.dart';
import 'package:base/features/authentication/ui/widgets/custom_text_form.dart';
import 'package:base/features/authentication/ui/widgets/login_bottom.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  void _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? savedName = prefs.getString("name");
    String? savedEmail = prefs.getString("email");
    String? savedPhone = prefs.getString("phone");
    String? savedDate = prefs.getString("date");
    String? savedGender = prefs.getString("gender");

    if (savedName != null) {
      _nameController.text = savedName;
    }
    if (savedEmail != null) {
      _emailController.text = savedEmail;
    }
    if (savedPhone != null) {
      _phoneController.text = savedPhone;
    }
    if (savedDate != null) {
      selectedDate = DateTime.parse(savedDate);
    }
    if (savedGender != null) {
      setState(() {
        selectedGender = savedGender;
      });
    }
  }

  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? selectedGender;
  DateTime? selectedDate;
  SnackBar snackBar = const SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 13),
    duration: Duration(seconds: 2),
    content: AwesomeSnackbarContent(
      color: Color(0xFF452CE8),
      title: "",
      messageTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
      message: "Your data is saved succesfuly",
      contentType: ContentType.failure,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: FadeInDown(
          from: 50,
          child: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              InkWell(
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        title: FadeInDown(
          from: 50,
          child: const Text(
            "My Profile",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: FadeIn(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextForm(
                          borderColor: const Color(0xFFE6E6E6),
                          onChanged: (value) {},
                          hint: "Enter your Full Name",
                          title: "Full Name",
                          textEditingController: _nameController,
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
                          borderColor: const Color(0xFFE6E6E6),
                          onChanged: (value) {},
                          hint: "Enter your email address",
                          title: "Email Address",
                          textEditingController: _emailController,
                          validator: (String? email) {
                            if (email!.length < 3) {
                              return "Name must be at least 3 letter";
                            } else if (!email.contains("@") ||
                                !email.contains(".com")) {
                              return "Enter valid email address";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Date of Birth",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
    initialDate: DateTime.now(),
  firstDate: DateTime(1900), // Allow dates from 1900
  lastDate: DateTime.now(), // Prevent future dates
                          );
                          if (pickedDate != null) {
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFFE6E6E6),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedDate != null
                                    ? DateFormat('dd/MM/yyyy')
                                        .format(selectedDate!)
                                    : "Select Date",
                                style: TextStyle(
                                  color: SettingsCubit.instance.isDarkMode
                                      ? selectedDate == null
                                          ? const Color(0xFFA7A5AF)
                                          : AppTheme.mainColor
                                      : const Color(0xFFA7A5AF),
                                  fontSize: 16,
                                ),
                              ),
                              const Icon(Icons.calendar_today,
                                  color: Color(0xFFA7A5AF)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Gender",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFFE6E6E6), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFFE6E6E6), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFFE6E6E6), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFFE6E6E6), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFFE6E6E6), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          enabled: false,
                          labelText: 'Select Gender',
                          labelStyle: TextStyle(
                            color: Color(0xFFA7A5AF),
                            fontSize: 16,
                          ),
                        ),
                        value: selectedGender,
                        items: [
                          DropdownMenuItem<String>(
                              value: "Male",
                              child: Text(
                                "Male",
                                style: TextStyle(
                                    color: SettingsCubit.instance.isDarkMode
                                        ? AppTheme.mainColor
                                        : Colors.black),
                              )),
                          DropdownMenuItem<String>(
                            value: "Female",
                            child: Text(
                              "Female",
                              style: TextStyle(
                                  color: SettingsCubit.instance.isDarkMode
                                      ? AppTheme.mainColor
                                      : Colors.black),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(
                            () {
                              selectedGender = value;
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextForm(
                        borderColor: const Color(0xFFE6E6E6),
                        prefix: SizedBox(
                          width: MediaQuery.of(context).size.width - 285,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: SvgPicture.asset(
                                        "assets/icons/us.svg")),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              const Icon(Icons.keyboard_arrow_down_rounded),
                              Text(
                                "   +1",
                                style: TextStyle(
                                    color: SettingsCubit.instance.isDarkMode
                                        ? AppTheme.mainColor
                                        : Colors.black,
                                    fontFamily: "Satoshi",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        hint: "Enter your phone number",
                        keyboardType: const TextInputType.numberWithOptions(),
                        textEditingController: _phoneController,
                        validator: (String? phone) {
                          if (phone!.length != 11) {
                            return "Phone must be 11 number";
                          }
                          return null;
                        },
                        onChanged: (String? value) {},
                        title: 'Phone Number',
                      ),
                      // const SizedBox(
                      //   height: 48,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: LoginBottom(
                textColor: const Color(0xFF6A70FF),
                color: const Color(0xFFDAE2FF),
                text: 'Save',
                ontap: () {
                  if (formKey.currentState!.validate()) {
                    SaveProfileData(
                        _nameController.text,
                        _emailController.text,
                        _phoneController.text,
                        selectedDate.toString(),
                        selectedGender!);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

SaveProfileData(
    String name, String email, String phone, String date, String gender) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("name", name);
  prefs.setString("email", email);
  prefs.setString("phone", phone);
  prefs.setString("date", date);
  prefs.setString("gender", gender);
}
