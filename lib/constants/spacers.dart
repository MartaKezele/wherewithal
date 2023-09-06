import 'package:flutter/material.dart';

import 'padding_size.dart';

abstract class HeightSpacer {
  static const SizedBox xxs = SizedBox(
    height: PaddingSize.xxs,
  );
  static const SizedBox xs = SizedBox(
    height: PaddingSize.xs,
  );
  static const SizedBox sm = SizedBox(
    height: PaddingSize.sm,
  );
  static const SizedBox md = SizedBox(
    height: PaddingSize.md,
  );
  static const SizedBox lg = SizedBox(
    height: PaddingSize.lg,
  );
  static const SizedBox xl = SizedBox(
    height: PaddingSize.xl,
  );
  static const SizedBox xxl = SizedBox(
    height: PaddingSize.xxl,
  );
}
