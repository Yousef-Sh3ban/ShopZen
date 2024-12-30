import 'package:base/app/bloc/settings_cubit.dart';
import 'package:base/configurations/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputField extends StatefulWidget {
  const DateInputField({
    super.key,
    this.label,
    this.onDateSelected,
    this.hint = "Select Date",
  });

  final Function(DateTime)? onDateSelected;
  final String hint;
  final String? label;

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.label != null)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.label!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        if (widget.label != null) const SizedBox(height: 8),
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                      ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                      : "Select Date",
                  style: TextStyle(
                    color: SettingsCubit.instance.isDarkMode
                        ? selectedDate == null
                            ? const Color(0xFFA7A5AF)
                            : AppTheme.mainColor
                        : selectedDate == null
                            ? const Color(0xFFA7A5AF)
                            : Color(0xFF57545B),
                    fontSize: 16,
                  ),
                ),
                const Icon(Icons.calendar_today, color: Color(0xFFA7A5AF)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
