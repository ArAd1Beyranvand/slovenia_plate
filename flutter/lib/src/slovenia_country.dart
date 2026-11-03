import 'package:plate_core/plate_core.dart';

import 'slovenia_colors.dart';

/// The `SLO` beneath the EU band is a [PlateLabel] on the spec, so
/// [PlateCountry.captionLines] is empty.
abstract final class SloveniaCountry {
  static const PlateCountry slovenia = PlateCountry.euroband(
    code: 'si',
    panelColor: SloveniaColors.euroBlue,
  );
}
