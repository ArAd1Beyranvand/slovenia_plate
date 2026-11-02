FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the peaceful people of Slovenia to view examples:

https://platexample.ir/#/discover/slovenia

# slovenia_plate

Slovenian licence plates for `plate_core`.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  slovenia_plate: ^0.1.0
```

## Use

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

## Contains

- `SloveniaCountry` — country panel: `slovenia`.
- `SloveniaPlates` — 4 plate specs: `private`, `exportPlate`, `police`, `diplomatic`.
- `SloveniaThemes` — 4 themes: `private`, `exportPlate`, `police`, `diplomatic`.
- `SloveniaValidator` — advisory validator; flags the frame, never blocks a keystroke.
- `SloveniaRegions` — code table.

## Plates

Not implemented: the temporary plate, military `SV`, motorcycle and the
other special plates (no usable reference). The crest in the registration
gap and the export date stickers are not drawn.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

