import 'dart:ui' show Color;

import 'package:flutter/widgets.dart' show EdgeInsets;
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'slovenia_colors.dart';
import 'slovenia_country.dart';

/// Where the ink sits, in plate units. Every photo is flattened to the
/// 520×120 the article gives (4 px per unit).
///
/// Euroband: blue x 3.3–46.5 (`Registrska_tablica`), 8.3–54.5 (`CD`) and
/// 18–53.5 (police); the flats crop the border differently, so one section
/// ends at 47 under the frame. Stars occupy y 9.5–~60, the `SLO` beneath them
/// to 104.
///
/// Centres (x), read off the flats' ink runs for the registration and
/// diplomatic plates and off the sheet at about ±5 for export and police:
/// - registration `LJ 898-KP`: `LJ` 85, 133; digits 240, 288, 336 (pitch
///   48); dash 375; `KP` 412, 470. The crest sits in the gap x 163–207, y
///   37–88 and is not drawn (a coat of arms, no usable vector).
/// - export `MB LL-251`: `MB` 65, 117; `LL` 190, 238; dash 274; digits 308,
///   352, 396. The two date stickers at the right are not drawn.
/// - police `P 06-697`: `P` 128; digits 242, 290; dash 330; 372, 420, 468.
///   The emblem x 163–205 is not drawn.
/// - diplomatic `CD 08-05`: `CD` 128, 181; digits 281, 328; dash 365; 403, 449
///   (pitch 46.7).
///
/// Ink is 95 tall on a 120 plate; a box that tall would need ~170, so every
/// box is the full canvas height and the ink lands near 66, about 70% of
/// reference.
abstract final class _Layout {
  static const double width = 520, height = 120;
  static const double bandEnd = 47;

  static const double box = 120, top = 0;

  // The box keeps the asset's 46 × 70.4 so the stars are never letterboxed
  // to a fractional offset; top 6.3 is where the old 77-tall box centred them.
  static const double starsLeft = 1, starsTop = 6.3;
  static const double starsWidth = 46, starsHeight = 70.4;
  static const double sloLeft = 4, sloTop = 78, sloWidth = 42;
  static const double sloHeight = 28, sloGlyph = 30;

  static const double dashWidth = 30;

  static const _Group privateRegion = _Group('region', <double>[85, 133], 48);
  static const _Group privateDigits = _Group('a', <double>[
    240,
    288,
    336,
  ], 48);
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

/// One keyed group of slots at the given centres, each [width] wide.
class _Group {
  const _Group(this.key, this.centres, this.width);

  final String key;
  final List<double> centres;
  final double width;
}

/// The Slovenian plates, each laid out as a `region` group, a dash and groups
/// `a` and `b`.
///
/// [private] is the current registration, `LJ 898-KP` black on white with the
/// EU band; [exportPlate] is the yellow export plate `MB LL-251` with no
/// band; [police] is `P 06-697` in blue; [diplomatic] is `CD 08-05` with the
/// `CD` in green.
///
/// Not implemented: the temporary plate (a red `PR` badge, whose photo is
/// CHECK-fitted), military `SV`, motorcycle and the other special plates; no
/// usable reference was measured for them. The crest and the export date
/// stickers are not drawn.
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

  static List<PlateSlot> _slots(
    _Group group,
    PlateAlphabet alphabet,
    Color? color,
  ) => <PlateSlot>[
    for (final double cx in group.centres)
      PlateSlot(
        alphabet: alphabet,
        box: PlateBox(
          cx - group.width / 2,
          _Layout.top,
          group.width,
          _Layout.box,
        ),
        color: color,
      ),
  ];

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
  }) {
    final List<PlateSlot> slots = <PlateSlot>[
      ..._slots(region, regionAlphabet, regionColor),
      ..._slots(a, aAlphabet, null),
      ..._slots(b, bAlphabet, null),
    ];
    int next = 0;
    PlateTextGroup group(_Group g) {
      final PlateTextGroup out = PlateTextGroup(<int>[
        for (int i = 0; i < g.centres.length; i++) next + i,
      ], key: g.key);
      next += g.centres.length;
      return out;
    }

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
      textGroups: <PlateTextGroup>[group(region), group(a), group(b)],
    );
  }
}
