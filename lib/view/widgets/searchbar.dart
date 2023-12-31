import 'package:flutter/material.dart';

class SearchBarCard extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Function(String)? onChanged;
  const SearchBarCard({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.bottom,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5.0),
            ),
         
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Color.fromARGB(255, 255, 255, 255),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
