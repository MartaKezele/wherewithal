import 'package:flutter/material.dart';

import '../../utils/form_field_validators.dart';

class EmailFormField extends StatefulWidget {
  const EmailFormField({
    Key? key,
    required this.controller,
    this.enabled = true,
  }) : super(key: key);

  final TextEditingController controller;
  final bool enabled;

  @override
  State<EmailFormField> createState() => _EmailFormFieldState();
}

class _EmailFormFieldState extends State<EmailFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        label: Text('Email'),
      ),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      validator: emailValidator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
