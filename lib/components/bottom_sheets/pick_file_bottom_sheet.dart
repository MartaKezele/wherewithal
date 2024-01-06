import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/styles/container.dart';
import '../../constants/styles/filled_button.dart';
import '../../l10n/app_localizations.dart';
import '../../extensions/button/filled_button.dart';
import '../../extensions/button/button_style_button.dart';

class PickFileBottomSheet extends StatelessWidget {
  const PickFileBottomSheet({
    super.key,
    required this.pickAndHandleGalleryImages,
    required this.takeAndHandleCameraImage,
    required this.pickAndHandlePDFfiles,
  });

  final Future<void> Function(AppLocalizations) pickAndHandleGalleryImages;
  final Future<void> Function(AppLocalizations) takeAndHandleCameraImage;
  final Future<void> Function(AppLocalizations) pickAndHandlePDFfiles;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: () async {
              context.pop();
              await takeAndHandleCameraImage(localizations);
            },
            child: Text(localizations.camera),
          )
              .iconOnTop(
                icon: Icons.photo_camera_rounded,
                colorStyle: FilledButtonStyles.primaryContainer,
              )
              .bottomSheetStyle(
                constructor: FilledButton.new,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      containerBorderRadius,
                    ),
                  ),
                ),
              ),
        ),
        Expanded(
          child: FilledButton(
            onPressed: () async {
              context.pop();
              await pickAndHandleGalleryImages(localizations);
            },
            child: Text(localizations.gallery),
          )
              .iconOnTop(
                icon: Icons.photo_library_rounded,
                colorStyle: FilledButtonStyles.inverseSurface,
              )
              .bottomSheetStyle(
                constructor: FilledButton.new,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      containerBorderRadius,
                    ),
                  ),
                ),
              ),
        ),
        Expanded(
          child: FilledButton(
            onPressed: () async {
              context.pop();
              await pickAndHandlePDFfiles(localizations);
            },
            child: Text(localizations.pdfFiles),
          )
              .iconOnTop(
                icon: Icons.picture_as_pdf_rounded,
                colorStyle: FilledButtonStyles.primaryContainer,
              )
              .bottomSheetStyle(
                constructor: FilledButton.new,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      containerBorderRadius,
                    ),
                  ),
                ),
              ),
        ),
      ],
    );
  }
}
