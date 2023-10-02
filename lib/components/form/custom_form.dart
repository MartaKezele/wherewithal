import 'package:flutter/material.dart';

import '../../constants/spacers.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
    required this.formKey,
    required this.contents,
  });

  final GlobalKey<FormState> formKey;
  final List<Widget> contents;

  @override
  Widget build(BuildContext context) {
    final widgets = List.generate(contents.length, (index) {
      if (index == 0) {
        return contents[index];
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeightSpacer.xs,
          contents[index],
        ],
      );
    });

    return Form(
      key: formKey,
      child: Column(
        children: widgets,
      ),
    );
  }
}
