import 'package:plate_core/plate_core.dart';

import 'slovenia_colors.dart';

/// Slovenia as a `PlateCountry`: the EU band. The twelve stars are the shared
/// asset `plate_core` ships; the `SLO` beneath them is a [PlateLabel] on the
/// spec, so [captionLines] is empty. The export plate has no band and sets
/// `noPanel`.
abstract final class SloveniaCountry {
  static const PlateCountry slovenia = PlateCountry(
    code: 'si',
    captionLines: <String>[],
    panelColor: SloveniaColors.euroBlue,
    panelTextColor: SloveniaColors.white,
    flagAspectRatio: 46 / 70.4,
    flag: SvgPlateAsset(
      'assets/flags/Flag_of_Europe.svg',
      package: 'plate_core',
    ),
  );
}
