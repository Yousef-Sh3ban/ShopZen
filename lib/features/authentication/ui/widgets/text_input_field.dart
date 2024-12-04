import 'package:base/app/widgets/fields/text_input_field.dart';
import 'package:flutter/material.dart';

class CustomTextInputField extends StatelessWidget {
  CustomTextInputField(
      {super.key,
      required this.hint,
      required this.title,
      required this.textEditingController});
  TextEditingController textEditingController = TextEditingController();
  String hint;
  String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        SizedBox(
          height: 4,
        ),
        TextInputField(
          borderRadius: BorderRadius.circular(8),
          hintText: hint,
          controller: textEditingController,
        ),
      ],
    );
  }
}
