// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../icon_handler.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({super.key, 
    this.onChange,
    this.controller,
    this.inputFormatters = const [],
    this.errorText,
    this.hintText,
    this.initialValue,
    this.labelText,
    this.withBottomPadding = true,
    this.hasError = false,
    this.keyboardType,
    this.suffixIcon,
    this.maxLines = 0,
    this.maxLength,
    this.backgroundColor,
    this.borderRadius,
    this.focusBorderColor,
    this.enableBorderColor,
    this.enableTimerBeforeChange = false,
  });

  final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool hasError;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final bool withBottomPadding;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter> inputFormatters;
  final bool enableTimerBeforeChange;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Color? focusBorderColor;
  final Color? enableBorderColor;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool showText = false;
  String? value;
  Timer? timer;

  _mapSuffixIcon() {
    if (widget.keyboardType == null) {
      return null;
    } else if (widget.keyboardType == TextInputType.emailAddress) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: drawSvgIcon("email_outlined", iconColor: Colors.grey),
      );
    } else if (widget.keyboardType == TextInputType.visiblePassword) {
      return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: drawSvgIcon(showText ? "eye_hide" : "eye"),
        ),
        onTap: () {
          setState(() {
            showText = !showText;
          });
        },
      );
    } else {
      return null;
    }
  }

  _onChange(String val){
    setState(() {
      if (val.isNotEmpty) {
        value = val;
      } else {
        value = null;
      }
    });
    widget.onChange?.call(val);
  }
  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    showText = widget.keyboardType != TextInputType.visiblePassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Text(
            widget.labelText ?? "",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        if (widget.labelText != null) const SizedBox(height: 8),
        SizedBox(
          height: 56,
          child: TextFormField(
            controller: widget.controller,
            initialValue: widget.controller != null ? null : widget.initialValue,
            onChanged: (val) {
              if (widget.enableTimerBeforeChange) {
                if (timer != null) {
                  timer!.cancel();
                }
                timer = Timer(Duration(seconds: 1), () {
                  _onChange(val);
                });
              }
              else {
                _onChange(val);
              }
            },
            keyboardType: widget.keyboardType ?? TextInputType.text,
            style: TextStyle(fontWeight: FontWeight.w300 ),
            obscureText: !showText && (widget.keyboardType == TextInputType.visiblePassword),
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey[400]),
              contentPadding: const EdgeInsets.all(16),
              suffixIcon: widget.suffixIcon ?? _mapSuffixIcon(),
              enabledBorder: _mapBorder(borderColor: widget.enableBorderColor??(value == null ? Colors.grey[400]! : Theme.of(context).colorScheme.primary)),
              focusedBorder: _mapBorder(borderColor: widget.focusBorderColor??Theme.of(context).colorScheme.primary),
              errorBorder: _mapBorder(borderColor: Colors.red),
              fillColor: widget.backgroundColor??Colors.white,
              filled: true,
            ),
          ),
        ),
        if (widget.hasError) const SizedBox(height: 8),
        if (widget.hasError)
          Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 16),
              const SizedBox(width: 4),
              Expanded(
                  child: Text(
                    widget.errorText ?? "Error",
                    style: const TextStyle(color: Colors.red),
                  )),
            ],
          ),
        if (widget.withBottomPadding) const SizedBox(height: 16),
      ],
    );
  }

  OutlineInputBorder _mapBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: widget.borderRadius??BorderRadius.circular(50),
      borderSide: BorderSide(color: borderColor),
    );
  }
}
