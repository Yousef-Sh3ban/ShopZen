import 'package:flutter/material.dart';
import '../../models/select_option.dart';

class MultiSelectInputField extends StatefulWidget {
  const MultiSelectInputField({
    super.key,
    this.label,
    this.onSelect,
    this.hint = "Select ",
    required this.valueSet,
  });

  final Function(DateTime)? onSelect;
  final List<SelectOption> valueSet;
  final String hint;
  final String? label;

  @override
  State<MultiSelectInputField> createState() => _MultiSelectInputFieldState();
}

class _MultiSelectInputFieldState extends State<MultiSelectInputField> {
  List<SelectOption> options = [];

  String get _selectedOptionsLabels {
    String labels = "";
    for (var option in options) {
      if (option.isSelected) labels += option.label + ", ";
    }
    return labels;
  }

  @override
  void initState() {
    options = widget.valueSet;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.label != null)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.label!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        if (widget.label != null) const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            options = await showMultiOptionsBottomSheet(
              context: context,
              label: widget.label!,
              valueSet: options,
            );
            setState(() {});
          },
          child: Container(
            height: 56,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedOptionsLabels.isEmpty ? widget.hint : _selectedOptionsLabels,
                    style: TextStyle(
                      color: _selectedOptionsLabels.isEmpty ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Icon(Icons.arrow_circle_down)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future<List<SelectOption>> showMultiOptionsBottomSheet({
  required BuildContext context,
  required String label,
  required List<SelectOption> valueSet,
}) async {

  await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (context) => Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context, valueSet);
                },
              ),
              Expanded(
                child: Text(
                  "Select ${label}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: valueSet.length,
              itemBuilder: (context, index) => BottomSheetOptionView(
                option: valueSet[index],
                onSelect: (option) {},
              ),
              separatorBuilder: (context, index) => Divider(height: 0),
            ),
          ),
        ],
      ),
    ),
  );
  return valueSet;
}

class BottomSheetOptionView extends StatefulWidget {
  const BottomSheetOptionView({super.key, required this.option, required this.onSelect});

  final SelectOption option;
  final Function(SelectOption) onSelect;

  @override
  State<BottomSheetOptionView> createState() => _BottomSheetOptionViewState();
}

class _BottomSheetOptionViewState extends State<BottomSheetOptionView> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.option.label),
      trailing: Icon(!widget.option.isSelected ? Icons.circle_outlined : Icons.circle),
      onTap: () {
        setState(() {
          widget.option.isSelected = !widget.option.isSelected;
          widget.onSelect(widget.option);
        });
      },
    );
  }
}
