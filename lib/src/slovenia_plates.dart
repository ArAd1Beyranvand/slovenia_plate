import 'dart:math';
import 'dart:ui' show Color;

import 'package:flutter/widgets.dart' show EdgeInsets;
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'slovenia_colors.dart';
import 'slovenia_country.dart';
import 'slovenia_regions.dart';

/// Plate-unit geometry, read off photos flattened to 520×120 (4 px per unit)
/// and, for export and police, off the sheet at about ±5.
///
/// The band's blue spans different x on each flat because the crops differ, so
/// one section ends at 47 under the frame. Ink is 95 tall on a 120 plate; a
/// box that tall would need ~170, so every box is the full canvas height and
/// the ink lands near 66, about 70% of reference.
abstract final class _Layout {
  static const double width = 520, height = 120;
  static const double bandEnd = 47;

  static const double box = 120, top = 0;

  // The box keeps the asset's 46 × 70.4 so the stars are never letterboxed
  // to a fractional offset.
  static const double starsLeft = 1, starsTop = 6.3;
  static const double starsWidth = 46, starsHeight = 70.4;
  static const double sloLeft = 4, sloTop = 78, sloWidth = 42;
  static const double sloHeight = 28, sloGlyph = 30;

  static const double dashWidth = 30;

  static const _Group privateRegion = _Group('region', <double>[85, 133], 48);
  static const _Group privateDigits = _Group('a', <double>[240, 288, 336], 48);
  static const _Group privateLetters = _Group('b', <double>[412, 470], 58);

  static const _Group exportRegion = _Group('region', <double>[65, 117], 52);
  static const _Group exportLetters = _Group('a', <double>[190, 238], 48);
  static const _Group exportDigits = _Group('b', <double>[308, 352, 396], 44);

  static const _Group policeCode = _Group('region', <double>[128], 50);
  static const _Group policeFirst = _Group('a', <double>[242, 290], 48);
  static const _Group policeSecond = _Group('b', <double>[372, 420, 468], 48);

  static const _Group dipCode = _Group('region', <double>[128, 181], 53);
  static const _Group dipFirst = _Group('a', <double>[281, 328], 47);
  static const _Group dipSecond = _Group('b', <double>[403, 449], 46);
}

/// One keyed field whose cells sit at the given centres, each [width] wide.
class _Group {
  const _Group(this.key, this.centres, this.width);

  final String key;
  final List<double> centres;
  final double width;
}

/// Not implemented: the temporary plate, military `SV`, motorcycle and the
/// other special plates (no usable reference). The crest in the registration
/// gap and the export date stickers are not drawn.
abstract final class SloveniaPlates {
  static final PlateSpec private = _spec(
    id: 'si.private',
    band: true,
    region: _Layout.privateRegion,
    regionAlphabet: SloveniaAlphabets.regionLetters,
    a: _Layout.privateDigits,
    aAlphabet: SloveniaAlphabets.digits,
    b: _Layout.privateLetters,
    bAlphabet: SloveniaAlphabets.letters,
    dashCx: 375,
    resolveRegion: SloveniaRegions.captionOf,
  );

  static final PlateSpec exportPlate = _spec(
    id: 'si.export',
    region: _Layout.exportRegion,
    regionAlphabet: SloveniaAlphabets.regionLetters,
    a: _Layout.exportLetters,
    aAlphabet: SloveniaAlphabets.letters,
    b: _Layout.exportDigits,
    bAlphabet: SloveniaAlphabets.digits,
    dashCx: 274,
    resolveRegion: SloveniaRegions.captionOf,
  );

  static final PlateSpec police = _spec(
    id: 'si.police',
    band: true,
    region: _Layout.policeCode,
    regionAlphabet: SloveniaAlphabets.policeLetter,
    a: _Layout.policeFirst,
    aAlphabet: SloveniaAlphabets.digits,
    b: _Layout.policeSecond,
    bAlphabet: SloveniaAlphabets.digits,
    dashCx: 330,
  );

  static final PlateSpec diplomatic = _spec(
    id: 'si.diplomatic',
    band: true,
    region: _Layout.dipCode,
    regionAlphabet: SloveniaAlphabets.diplomaticLetters,
    regionColor: SloveniaColors.diplomaticGreen,
    a: _Layout.dipFirst,
    aAlphabet: SloveniaAlphabets.digits,
    b: _Layout.dipSecond,
    bAlphabet: SloveniaAlphabets.digits,
    dashCx: 365,
  );

  static List<PlateSpec> get all => <PlateSpec>[
    private,
    exportPlate,
    police,
    diplomatic,
  ];

  /// The group as one slot: its box spans the cells at their pitch.
  static PlateSlot _slot(_Group group, PlateAlphabet alphabet, Color? color) {
    final int count = group.centres.length;
    final double pitch = count > 1
        ? (group.centres.last - group.centres.first) / (count - 1)
        : group.width;
    return PlateSlot(
      alphabet: alphabet,
      box: PlateBox(
        group.centres.first - pitch / 2,
        _Layout.top,
        count * pitch,
        _Layout.box,
      ),
      color: color,
      length: count,
      spacing: max(0, pitch - 0.6 * 0.72 * _Layout.box),
    );
  }

  static PlateSpec _spec({
    required String id,
    required _Group region,
    required PlateAlphabet regionAlphabet,
    required _Group a,
    required PlateAlphabet aAlphabet,
    required _Group b,
    required PlateAlphabet bAlphabet,
    required double dashCx,
    bool band = false,
    Color? regionColor,
    PlateLabelResolver? resolveRegion,
  }) {
    final List<PlateSlot> slots = <PlateSlot>[
      _slot(region, regionAlphabet, regionColor),
      _slot(a, aAlphabet, null),
      _slot(b, bAlphabet, null),
    ];
    return PlateSpec(
      id: id,
      country: SloveniaCountry.slovenia,
      canvasWidth: _Layout.width,
      canvasHeight: _Layout.height,
      panel: band
          ? const PlatePanel(
              box: PlateBox(
                _Layout.starsLeft,
                _Layout.starsTop,
                _Layout.starsWidth,
                _Layout.starsHeight,
              ),
              padding: EdgeInsets.zero,
            )
          : const PlatePanel(box: PlateBox(0, 0, 0, 0)),
      noPanel: !band,
      background: band
          ? const PlateSection.columns(<PlatePart>[
              PlatePart(
                PlateSection.fill(PlateFill.panel),
                end: _Layout.bandEnd,
              ),
              PlatePart(PlateSection.plain),
            ])
          : PlateSection.plain,
      slots: slots,
      labels: <PlateLabel>[
        if (band)
          const PlateLabel(
            text: 'SLO',
            box: PlateBox(
              _Layout.sloLeft,
              _Layout.sloTop,
              _Layout.sloWidth,
              _Layout.sloHeight,
            ),
            glyphHeight: _Layout.sloGlyph,
            color: SloveniaColors.white,
          ),
        PlateLabel(
          text: '-',
          box: PlateBox(
            dashCx - _Layout.dashWidth / 2,
            _Layout.top,
            _Layout.dashWidth,
            _Layout.box,
          ),
          glyphHeight: _Layout.box,
        ),
      ],
      textGroups: <PlateTextGroup>[
        for (final (int i, _Group g) in <_Group>[region, a, b].indexed)
          PlateTextGroup(<int>[i], key: g.key),
      ],
      resolveRegion: resolveRegion,
    );
  }
}
