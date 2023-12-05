import 'package:flutter/material.dart';

import '../padding_size.dart';

const legendColorContainerSize = 15.0;
const selectedSectionRadius = 55.0;
const unselectedSectionRadius = 40.0;
const numberOfShowcasedSections = 3;

double pieChartSize(BuildContext context) =>
    MediaQuery.of(context).size.width - 4 * PaddingSize.xxl;

