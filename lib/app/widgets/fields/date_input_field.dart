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
            child: Text(widget.label!, style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
          ),
        if (widget.label != null) const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2015, 8),
              lastDate: DateTime(2101),
            );
            if (picked != null) {
              setState(() {
                selectedDate = picked;
              });
            }
          },
          child: Container(
            height: 56,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedDate == null ? widget.hint : DateFormat("EEE, MMM d, ''yy").format(selectedDate!),
                    style: TextStyle(
                      color: selectedDate == null ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.calendar_month)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
