import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInputField extends StatefulWidget {
  const ImageInputField({super.key, this.label, this.onImagePicked, this.hint = "Select Image"});
  final Function(DateTime)? onImagePicked;
  final String hint;
  final String? label;
  @override
  State<ImageInputField> createState() => _ImageInputFieldState();
}

class _ImageInputFieldState extends State<ImageInputField> {
  File? image;

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
            ImagePicker picker = ImagePicker();
            XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
            if (pickedImage != null) {
              setState(() {
                image = File(pickedImage.path);
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
                if (image == null) const Icon(Icons.image, size: 48),
                if (image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      image!,
                      height: 48,
                      width: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 8),
                if (image == null)Text(widget.hint, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                if (image != null) const SizedBox(height: 8),
                if (image != null)
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        image = null;
                      });
                    },
                    child: const Text("Clear"),
                  ),
                // Text(image!.path.split("/").last, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
