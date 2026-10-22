import 'package:flutter_test/flutter_test.dart';
import 'package:plate_core/plate_core.dart';
import 'package:slovenia_plate/slovenia_plate.dart';

void main() {
  test('a full area code names the area', () {
    expect(SloveniaRegions.lookup('LJ'), 'Ljubljana');
    expect(SloveniaRegions.lookup('KP'), 'Koper');
    expect(SloveniaRegions.lookup('SG'), 'Slovenj Gradec');
  });

  test('a first letter names the area only when unambiguous', () {
    expect(SloveniaRegions.lookup('L'), 'Ljubljana');
    expect(SloveniaRegions.lookup('G'), 'Nova Gorica');
    for (final String code in <String>['K', 'M', '']) {
      expect(SloveniaRegions.lookup(code), isNull, reason: code);
    }
  });

  test('unissued codes name nothing', () {
    for (final String code in <String>['AA', 'LX', 'Z']) {
      expect(SloveniaRegions.lookup(code), isNull, reason: code);
    }
  });

  test('private and export plates follow each letter; others have none', () {
    for (final PlateSpec spec in <PlateSpec>[SloveniaPlates.private, SloveniaPlates.exportPlate]) {
      final PlateController c = PlateController(spec: spec);
      expect(c.regionCaption, isNull, reason: spec.id);
      c.setGroup('region', 'M');
      expect(c.regionCaption, isNull, reason: spec.id);
      c.setGroup('region', 'MB');
      expect(c.regionCaption, 'Maribor', reason: spec.id);
      c.setGroup('region', 'M');
      expect(c.regionCaption, isNull, reason: spec.id);
    }
    expect(SloveniaPlates.police.resolveRegion, isNull);
    expect(SloveniaPlates.diplomatic.resolveRegion, isNull);
  });
}
