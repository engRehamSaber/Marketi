import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap; 

  const CustomTextField({
    super.key,
    required this.icon,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.onSuffixTap, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, size: 22),
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixTap, 
                child: Icon(suffixIcon, size: 22),
              )
            : null,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blue.shade100),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blue.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }
}
