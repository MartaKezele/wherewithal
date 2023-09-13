import 'package:flutter/material.dart';

import '../../../config/password.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/form_field_validators.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        label: Text(localizations.password),
        hintText: localizations.minCharacters(minPasswordCharacters),
        hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      autocorrect: false,
      validator: (password) => passwordValidator(password),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
