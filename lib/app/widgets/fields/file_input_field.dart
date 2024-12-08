import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileInputField extends StatefulWidget {
  const FileInputField({super.key, this.label, this.onFilePicked, this.hint = "Select File"});

  final Function(DateTime)? onFilePicked;
  final String hint;
  final String? label;

  @override
  State<FileInputField> createState() => _FileInputFieldState();
}

class _FileInputFieldState extends State<FileInputField> {
  File? file;

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
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              setState(() {
                file = File(result.files.single.path!);
              });
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (file == null) const Icon(Icons.file_copy_outlined, size: 48),
                if (file != null) const Icon(Icons.file_copy, size: 48),
                const SizedBox(height: 8),
                if (file != null) Text(file!.path.split("/").last, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                const SizedBox(height: 8),
                if (file == null) Text(widget.hint, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                if (file != null) const SizedBox(height: 8),
                if (file != null)
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        file = null;
                      });
                    },
                    child: const Text("Clear"),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
