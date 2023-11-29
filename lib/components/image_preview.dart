import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/padding_size.dart';
import '../constants/spacers.dart';
import '../constants/styles/container.dart';
import '../constants/styles/icon_button.dart';
import '../constants/styles/image_preview.dart';
import '../../extensions/button/icon_button.dart';

// TODO permission to view images
class ImagePreview extends StatelessWidget {
  const ImagePreview({
    super.key,
    required this.onRemovePressed,
    required this.imageFile,
    this.errorMessage,
  });

  final void Function() onRemovePressed;
  final XFile imageFile;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: imagePreviewWidthHeight,
          height: imagePreviewWidthHeight,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: PaddingSize.md,
                  left: PaddingSize.sm,
                ),
                child: AspectRatio(
                  aspectRatio: imagePreviewAspectRatio,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(containerBorderRadius),
                    child: Image.file(
                      File(imageFile.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton.filled(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.close_rounded),
                  onPressed: onRemovePressed,
                ).colorStyle(FilledIconButtonStyles.error),
              ),
            ],
          ),
        ),
        HeightSpacer.xxs,
        if (errorMessage != null)
          SizedBox(
            width: imagePreviewWidthHeight,
            child: Text(
              errorMessage!,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
