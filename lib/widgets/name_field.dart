import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NameField extends StatelessWidget {
  final String svgIcon; // مسار الأيقونة بصيغة SVG
  final String hintText;

  const NameField({
    super.key,
    required this.svgIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12), // تعديل الحجم ليكون مناسبًا
          child: SvgPicture.asset(
            svgIcon,
            width: 20, // عرض الأيقونة
            height: 20, // ارتفاع الأيقونة
          ),
        ),
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
