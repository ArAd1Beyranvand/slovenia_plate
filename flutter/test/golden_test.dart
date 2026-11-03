import 'package:flutter_test/flutter_test.dart';
import 'package:plate_core/plate_core.dart';
import 'package:plate_core/testing.dart';
import 'package:slovenia_plate/slovenia_plate.dart';

void main() {
  plateGoldens('si', SloveniaCountry.slovenia, <String, PlateGoldenCase>{
    'private': (SloveniaPlates.private, SloveniaThemes.private, 'LJ 898 KP'),
    'export': (
      SloveniaPlates.exportPlate,
      SloveniaThemes.exportPlate,
      'MB LL 251',
    ),
    'police': (SloveniaPlates.police, SloveniaThemes.police, 'P 06 697'),
    'diplomatic': (
      SloveniaPlates.diplomatic,
      SloveniaThemes.diplomatic,
      'CD 08 05',
    ),
  });

  test('each group is one slot of its printed length', () {
    expect(SloveniaPlates.private.slots.map((PlateSlot s) => s.length), <int>[
      2,
      3,
      2,
    ]);
    expect(SloveniaPlates.police.slots.map((PlateSlot s) => s.length), <int>[
      1,
      2,
      3,
    ]);
    final PlateController c = PlateController.fromValues(
      SloveniaPlates.private,
      <String?>['LJ', '89', 'KP'],
    );
    expect(c.isCompleted, isFalse);
    c.dispose();
  });
}
