import 'package:flutter/material.dart';

import '../../constants/color_schemes/chart_color_pallete.dart';

Color chartSectionColorFromIndex(int sectionIndex) {
  int colorIndex;

  if (sectionIndex > chartColorPallete.length - 1) {
    colorIndex = sectionIndex +
        1 -
        (((sectionIndex + 1) / chartColorPallete.length).floor() *
            chartColorPallete.length);
  } else {
    colorIndex = sectionIndex;
  }

  return chartColorPallete[colorIndex];
}
