FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the peaceful people of Slovenia to view examples:

https://platexample.ir/#/discover/slovenia:python

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

### Install (Python)

Copy `python/plates/countries/slovenia/` into `plate_core/python/plates/countries/`.

Then run the tests from `plate_core/python/`: `pytest`.

### Use

```python
from plates.countries.slovenia.data import SPECS, THEMES

spec = SPECS["si.private"]
theme = THEMES["SloveniaThemes.private"]
print(spec.id)
```

## Specs

The specs are the same in every language (they come from shared data).

- `si.private`
- `si.export`
- `si.police`
- `si.diplomatic`

## Themes

- `SloveniaThemes.private`
- `SloveniaThemes.exportPlate`
- `SloveniaThemes.police`
- `SloveniaThemes.diplomatic`

## Change it

- Pick a spec: use another key of `SPECS`.
- Pick a theme: use another key of `THEMES`.
- Validators: `VALIDATORS` maps the names `SloveniaValidator` to classes.

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/slovenia_plate/blob/main/LICENSE).
