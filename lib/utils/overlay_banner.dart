import 'package:flutter/material.dart';

import '../app_models/action_result.dart';
import '../components/action_result_overlay_banner.dart';

OverlayEntry? showActionResultOverlayBanner(
  BuildContext context,
  ActionResult result,
) {
  if (result.show == false) {
    return null;
  }
  OverlayEntry? overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) => ActionResultOverlayBanner(
      result: result,
      onDismissed: () => hideOverlayBanner(overlayEntry),
    ),
  );

  Overlay.of(context).insert(overlayEntry);
  return overlayEntry;
}

void hideOverlayBanner(OverlayEntry? overlayEntry) {
  if (overlayEntry != null && overlayEntry.mounted) {
    overlayEntry.remove();
  }
}
