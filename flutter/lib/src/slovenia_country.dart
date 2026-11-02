import 'package:plate_core/plate_core.dart';

import 'slovenia_colors.dart';

/// The `SLO` beneath the EU band is a [PlateLabel] on the spec, so
/// [PlateCountry.captionLines] is empty.
abstract final class SloveniaCountry {
  static const PlateCountry slovenia = PlateCountry(
    code: 'si',
    captionLines: <String>[],
    panelColor: SloveniaColors.euroBlue,
    panelTextColor: SloveniaColors.white,
    flagAspectRatio: 46 / 70.4,
    flag: EuropeanStars.band,
  );
}
