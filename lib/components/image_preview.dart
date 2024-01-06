import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/padding_size.dart';
import '../constants/spacers.dart';
import '../constants/styles/container.dart';
import '../constants/styles/icon_button.dart';
import '../constants/styles/image_preview.dart';
import '../../extensions/button/icon_button.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({
    super.key,
    required this.onRemovePressed,
    this.imageFile,
    this.file,
    this.errorMessage,
  });

  final void Function() onRemovePressed;
  final XFile? imageFile;
  final PlatformFile? file;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    Widget img;

    if (imageFile?.path != null) {
      img = Image.file(
        File(imageFile!.path),
        fit: BoxFit.cover,
      );
    }

    img = const Icon(Icons.picture_as_pdf_rounded);

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
                    child: img,
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
