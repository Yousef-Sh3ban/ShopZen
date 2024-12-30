import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddressTile extends StatelessWidget {
  final String label;
  final String address;
  final bool selected;
  final VoidCallback onTap;

  const AddressTile({
    super.key,
    required this.label,
    required this.address,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset("assets/icons/loction.svg"),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(address),
      trailing: selected
          ? Stack(children: [
              const Icon(Icons.circle_outlined, color: Colors.black),
              Container(
                margin: const EdgeInsets.all(4.5),
                child: const Icon(Icons.circle, color: Colors.black, size: 15),
              ),
            ])
          : const Icon(Icons.circle_outlined, color: Colors.grey),
      onTap: onTap,
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Widget child;

  const CustomContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5), // إضافة البوردر هنا
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
