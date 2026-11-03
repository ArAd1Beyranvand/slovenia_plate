import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:slovenia_plate/slovenia_plate.dart';

void main() => runApp(
  PlateExampleApp(spec: SloveniaPlates.private, theme: SloveniaThemes.private),
);
