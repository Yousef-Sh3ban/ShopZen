import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({
    super.key,
    required this.hint,
    required this.title,
    required this.textEditingController,
    this.ispassword = false,
    required this.validator,
    this.keyboardType,
    required this.onChanged,
  });
  final TextInputType? keyboardType;
  final String hint;
  final String title;
  final bool ispassword;
  final TextEditingController textEditingController;
  final String? Function(String? value) validator;
  final void Function(String? value) onChanged;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool obscure = true;
  bool on = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        TextFormField(
          keyboardType: widget.keyboardType ?? TextInputType.text,
          inputFormatters: [
            FilteringTextInputFormatter.singleLineFormatter,
          ],
          onChanged: widget.onChanged,
          validator: widget.validator,
          obscureText: obscure && widget.ispassword,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            suffixIcon: widget.ispassword
                ? MaterialButton(
                    onPressed: () {
                      setState(
                        () {
                          obscure = !obscure;
                          on = !on;
                        },
                      );
                    },
                    child: SizedBox(  
                      width: 45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          on
                              ? SvgPicture.asset(
                                  "assets/icons/eye_on.svg",
                                )
                              : SvgPicture.asset(
                                  "assets/icons/eye_off.svg",
                                ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
            prefix: const SizedBox(
              width:7,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFA7A5AF),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFF323135),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFF323135),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFF323135),
              ),
            ),
            hintText: widget.hint,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFFA7A5AF),
            ),
          ),
        ),
      ],
    );
  }
}
