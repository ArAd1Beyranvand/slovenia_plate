/// Slovenian licence plates for `plate_core`.
library;

// TODO(py): [D5] one module `plates.countries.slovenia`; assets via importlib.resources.
// TODO(ts): [D5] one subpath export `./countries/slovenia`; tree-shakable.
// TODO(kt): [D5] package `countries.slovenia` in the countries module.
export 'src/slovenia_colors.dart';
export 'src/slovenia_country.dart';
export 'src/slovenia_plates.dart';
export 'src/slovenia_regions.dart';
export 'src/slovenia_themes.dart';
export 'src/slovenia_validators.dart';
export 'package:plate_alphabet/plate_alphabet.dart' show SloveniaAlphabets;
