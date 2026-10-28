import 'package:plate_core/plate_core.dart';

/// Locates a Slovenian plate from its two-letter registration area.
///
/// Source: the "Location prefixes and regional divisions" table of
/// https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Slovenia
/// The municipality is told by the crest after the code, which is not typed,
/// so the caption stops at the area.
abstract final class SloveniaRegions {
  static const Map<String, String> _areas = <String, String>{
    'CE': 'Celje',
    'GO': 'Nova Gorica',
    'KK': 'Krško',
    'KP': 'Koper',
    'KR': 'Kranj',
    'LJ': 'Ljubljana',
    'MB': 'Maribor',
    'MS': 'Murska Sobota',
    'NM': 'Novo Mesto',
    'PO': 'Postojna',
    'SG': 'Slovenj Gradec',
  };

  /// The area of [code] (one or two letters), or null when it matches no code
  /// or several.
  static String? lookup(String code) {
    if (code.isEmpty) return null;
    final Set<String> names = <String>{
      for (final MapEntry<String, String> e in _areas.entries)
        if (e.key.startsWith(code)) e.value,
    };
    return names.length == 1 ? names.single : null;
  }

  /// A [PlateLabelResolver] for [PlateSpec.resolveRegion].
  static String? captionOf(String Function(String key) group) =>
      lookup(group('region'));
}
