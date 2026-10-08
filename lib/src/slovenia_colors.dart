import 'package:flutter/widgets.dart';

/// The colours of the Slovenian plates, sampled from the flattened photos
/// (modal pixel of the region).
///
/// The euroband `033FA2` is the EU flag's blue as `spain_plate` uses it: the
/// photographed bands read `009CFC` and `005CFC` under their lighting, which
/// is exposure, not a second blue. The export field `F0E000` and its green
/// frame `307800`, the police blue `0426B0` (the brief's balanced value; the
/// raw pixels read `001C90`) and the diplomatic green `38B838` with its frame
/// `30A020` are photographed colours and carry their photo's lighting.
abstract final class SloveniaColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF181924);
  static const Color euroBlue = Color(0xFF033FA2);

  static const Color exportYellow = Color(0xFFF0E000);
  static const Color exportInk = Color(0xFF202038);
  static const Color exportFrame = Color(0xFF307800);

  static const Color policeBlue = Color(0xFF0426B0);

  static const Color diplomaticGreen = Color(0xFF38B838);
  static const Color diplomaticFrame = Color(0xFF30A020);

  static const Color inactive = Color(0xFFB0B0B0);
}
