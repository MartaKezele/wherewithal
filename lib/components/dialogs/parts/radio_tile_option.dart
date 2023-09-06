import 'package:flutter/material.dart';

import '../../../constants/padding_size.dart';
import '../../../constants/styles/opacity.dart';

class RadioTileDialogOption<T> extends StatelessWidget {
  const RadioTileDialogOption({
    Key? key,
    required this.value,
    this.groupValue,
    required this.title,
    this.onChanged,
    this.subtitle,
    this.secondary,
  }) : super(key: key);

  final T value;
  final T? groupValue;
  final String title;
  final void Function(T?)? onChanged;
  final String? subtitle;
  final Widget? secondary;

  @override
  Widget build(BuildContext context) {
    final activeColor = Theme.of(context).colorScheme.onSurface;

    return SimpleDialogOption(
      padding: EdgeInsets.zero,
      child: RadioListTile(
        value: value,
        groupValue: groupValue,
        activeColor: activeColor,
        overlayColor: MaterialStatePropertyAll(
          activeColor.withOpacity(overlayOpacity),
        ),
        title: Text(title),
        onChanged: onChanged,
        subtitle: subtitle != null ? Text(subtitle!) : null,
        secondary: secondary,
        contentPadding: const EdgeInsets.fromLTRB(
          PaddingSize.sm,
          0.0,
          PaddingSize.xl,
          0.0,
        ),
      ),
    );
  }
}
