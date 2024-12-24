import 'package:flutter/material.dart';

class AddressTile extends StatelessWidget {
  final String label;
  final String address;
  final bool selected;
  final VoidCallback onTap;

  const AddressTile({super.key, 
    required this.label,
    required this.address,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.location_on, color: Colors.deepPurple),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(address),
      trailing: selected
          ? const Icon(Icons.circle, color: Colors.green)
          : const Icon(Icons.circle_outlined, color: Colors.grey),
      onTap: onTap,
    );
  }
}
