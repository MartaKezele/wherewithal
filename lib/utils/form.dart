import 'package:flutter/material.dart';

void executeFnIfFormValid({
  required GlobalKey<dynamic> formKey,
  required Future<void> Function() fn,
}) {
  FocusManager.instance.primaryFocus?.unfocus();

  if (formKey.currentState == null) {
    debugPrint('Form widget state is null.');
    return;
  }

  if (formKey.currentState!.validate()) {
    fn();
  }
}
