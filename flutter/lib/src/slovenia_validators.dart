import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

// TODO(py): [H9] Python re: \d/\w match Unicode; keep explicit [0-9]/[A-Z] classes (or re.ASCII).
// TODO(ts): [H9] same flavour as Dart; port as is, cover accept/reject in the vectors (D9).
// TODO(kt): [H9] Regex engine differs per target (JVM/JS/Native): keep to portable syntax.
final RegExp _twoLetters = RegExp(r'^[A-Z]{2}$');

// TODO(py): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
// TODO(ts): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
// TODO(kt): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
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
    final (bool ok, String reason) = switch (region) {
      'P' => (isDigitsOfLength(a, 2) && isDigitsOfLength(b, 3), reasonPolice),
      'CD' => (
        isDigitsOfLength(a, 2) && isDigitsOfLength(b, 2),
        reasonDiplomatic,
      ),
      _ when !SloveniaAlphabets.regionCodes.contains(region) => (
        false,
        reasonRegion,
      ),
      _ => (
        (isDigitsOfLength(a, 3) && _twoLetters.hasMatch(b)) ||
            (_twoLetters.hasMatch(a) && isDigitsOfLength(b, 3)),
        reasonSerial,
      ),
    };
    return ok ? const PlateValidation.valid() : PlateValidation.invalid(reason);
  }
}
