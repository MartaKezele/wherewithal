import 'package:flutter/material.dart';

import '../../constants/padding_size.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
    required this.formKey,
    required this.contents,
    this.spacing = PaddingSize.xs,
  });

  final GlobalKey<FormState> formKey;
  final List<Widget> contents;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final widgets = List.generate(contents.length, (index) {
      if (index == 0) {
        return contents[index];
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: spacing,
          ),
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
