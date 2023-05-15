import 'package:flutter/material.dart';

class CustomCostDetails extends StatelessWidget {
  const CustomCostDetails({
    super.key,
    required this.data,
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final String data;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(25)),
            child: IconButton(
              icon: Icon(icon),
              onPressed: onPressed,
            )),
        Text(data),
      ],
    );
  }
}
