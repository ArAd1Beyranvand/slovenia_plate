FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the peaceful people of Slovenia to view examples:

https://platexample.ir/#/discover/slovenia:flutter

# slovenia_plate

Slovenia's licence plates for the plate_core library: the EU-band registration, export, police and diplomatic plates, with an advisory validator.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/slovenia_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/slovenia:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/slovenia_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/slovenia:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/slovenia_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/slovenia:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/slovenia_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/slovenia:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  slovenia_plate: ^0.1.0
```

### Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:slovenia_plate/slovenia_plate.dart';

PlateCanvas(
  spec: SloveniaPlates.private,
  theme: SloveniaThemes.private,
  validator: const SloveniaValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Specs

Each spec is one plate layout.

- `SloveniaPlates.private` — id `si.private`
- `SloveniaPlates.exportPlate` — id `si.export`
- `SloveniaPlates.police` — id `si.police`
- `SloveniaPlates.diplomatic` — id `si.diplomatic`

## Themes

- `SloveniaThemes.private`
- `SloveniaThemes.exportPlate`
- `SloveniaThemes.police`
- `SloveniaThemes.diplomatic`

## Change it

`PlateCanvas` takes `spec:` (an entry of `SloveniaPlates`) and `theme:` (an entry of `SloveniaThemes`). Set `validator:` to `SloveniaValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `SloveniaCountry` — the country panel.
- `SloveniaValidator` — the plate validator.
- `SloveniaRegions` — code table.

## Plates

Not implemented: the temporary plate, military `SV`, motorcycle and the
other special plates (no usable reference). The crest in the registration
gap and the export date stickers are not drawn.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/slovenia_plate/blob/main/LICENSE).
