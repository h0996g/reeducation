import 'package:flutter/material.dart';

import 'text_form_field_widget.dart';

class PasswordTextFormFieldWidget extends StatefulWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const PasswordTextFormFieldWidget({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.validator,
  });

  @override
  State<PasswordTextFormFieldWidget> createState() =>
      _PasswordTextFormFieldWidgetState();
}

class _PasswordTextFormFieldWidgetState
    extends State<PasswordTextFormFieldWidget> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      label: widget.label,
      hint: widget.hint,
      controller: widget.controller,
      obscureText: _obscure,
      validator: widget.validator,
      suffixIcon: IconButton(
        icon: Icon(
          _obscure ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
        onPressed: () => setState(() => _obscure = !_obscure),
      ),
    );
  }
}
