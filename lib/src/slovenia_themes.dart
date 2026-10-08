import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'slovenia_colors.dart';

/// One ink on one field; the export and diplomatic plates carry a frame in a
/// colour of its own, the registration plate none.
///
/// Frame widths are read off the flats at about 0.03 of the 120 height, the
/// corner arc at about 0.07; neither is measured more closely than that.
abstract final class SloveniaThemes {
  /// Registration: black on white, no frame.
  static final PlateTheme private = _theme(
    SloveniaColors.white,
    SloveniaColors.black,
    SloveniaColors.white,
    0,
  );

  /// Export: dark on yellow inside a green frame.
  static final PlateTheme exportPlate = _theme(
    SloveniaColors.exportYellow,
    SloveniaColors.exportInk,
    SloveniaColors.exportFrame,
    0.03,
  );

  /// Police: blue on white, a thin grey frame.
  static final PlateTheme police = _theme(
    SloveniaColors.white,
    SloveniaColors.policeBlue,
    const Color(0xFFA8A8AC),
    0.02,
  );

  /// Diplomatic: black digits (the green `CD` is a slot colour) in a green
  /// frame.
  static final PlateTheme diplomatic = _theme(
    SloveniaColors.white,
    SloveniaColors.black,
    SloveniaColors.diplomaticFrame,
    0.03,
  );
}

PlateTheme _theme(Color field, Color ink, Color frame, double border) =>
    PlateTheme.monochrome(
      field: field,
      ink: ink,
      inactive: SloveniaColors.inactive,
      borderWidthRatio: border,
      plateRadiusRatio: 0.07,
    ).copyWith(plateBorder: frame);
