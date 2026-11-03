FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the peaceful people of Slovenia to view examples:

https://platexample.ir/#/discover/slovenia:kotlin

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

### Install (Kotlin)

Copy `kotlin/src/commonMain/kotlin/plates/countries/slovenia/` into `plate_core/kotlin/src/commonMain/kotlin/plates/countries/`.

Then run the tests from `plate_core/kotlin/`: `./gradlew jvmTest`.

### Use

```kotlin
import plates.countries.slovenia.country

val spec = country.specs["si.private"]
println(country.pkg)
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

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (`SloveniaValidator`).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/slovenia_plate/blob/main/LICENSE).
