import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? errorMsg;
  final String? Function(String?)? onChanged;
  final Color textColor;

    const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.validator,
    this.focusNode,
    this.errorMsg,
    this.onChanged,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onTap: onTap,
      textInputAction: TextInputAction.next,
       validator: validator,
      style: TextStyle(color: textColor ),
      focusNode: focusNode,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        iconColor: Theme.of(context).colorScheme.primary,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        fillColor: const Color.fromARGB(255, 84, 82, 82),
        filled: true,
        
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 212, 203, 203),
        ),
        errorText: errorMsg,
      ),
     
    );
  }
}
