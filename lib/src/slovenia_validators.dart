import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

/// Judges a Slovenian plate by its three groups, `region`, `a`, `b`.
///
/// A registration is a unit code and then either three digits and two letters
/// (`LJ 898-KP`) or two letters and three digits (the export `MB LL-251`);
/// police is `P` and two plus three digits; diplomatic is `CD` and two plus
/// two digits. Reports, never bars a keystroke.
class SloveniaValidator extends GatedPlateValidator {
  const SloveniaValidator();

  @override
  String get gateGroup => 'b';

  static const String reasonRegion = 'The unit code is two letters, e.g. LJ.';
  static const String reasonPolice = 'Police is P, two digits, three digits.';
  static const String reasonDiplomatic =
      'Diplomatic is CD, two digits, two digits.';
  static const String reasonSerial =
      'The serial is three digits and two letters, or two letters and three '
      'digits.';

  @override
  PlateValidation judge(PlateEntry entry) {
    final String region = entry.group('region');
    final String a = entry.group('a');
    final String b = entry.group('b');
    if (region == 'P') {
      return isDigitsOfLength(a, 2) && isDigitsOfLength(b, 3)
          ? const PlateValidation.valid()
          : const PlateValidation.invalid(reasonPolice);
    }
    if (region == 'CD') {
      return isDigitsOfLength(a, 2) && isDigitsOfLength(b, 2)
          ? const PlateValidation.valid()
          : const PlateValidation.invalid(reasonDiplomatic);
    }
    if (!SloveniaAlphabets.regionCodes.contains(region)) {
      return const PlateValidation.invalid(reasonRegion);
    }
    final RegExp letters = RegExp(r'^[A-Z]{2}$');
    final bool ok =
        (isDigitsOfLength(a, 3) && letters.hasMatch(b)) ||
        (letters.hasMatch(a) && isDigitsOfLength(b, 3));
    return ok
        ? const PlateValidation.valid()
        : const PlateValidation.invalid(reasonSerial);
  }
}
