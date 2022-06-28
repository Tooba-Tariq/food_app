import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  const FormTextField({
    Key? key,
    required this.label,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);
  final String label;
  final bool obscureText;
  final TextEditingController controller;
  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: TextFormField(
          obscureText: widget.obscureText,
          controller: widget.controller,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          keyboardType:widget.label == 'Phone'?TextInputType.number:TextInputType.name,
         
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            fillColor: Colors.grey.shade100,
            filled: true,
            enabledBorder: InputBorder.none,
            hintText: widget.label,
            hintStyle: Theme.of(context).textTheme.labelMedium,
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
