"""Port of slovenia_plate/lib/src/slovenia_validators.dart."""
from __future__ import annotations

import re

from plates.core.validators.plate_validator import GatedPlateValidator, PlateEntry, PlateValidation, is_digits_of_length

_REGION_CODES = ("CE", "GO", "KK", "KP", "KR", "LJ", "MB", "MS", "NM", "PO", "SG")


def _two_letters(v: str) -> bool:
    return re.fullmatch(r"[A-Z]{2}", v) is not None


class SloveniaValidator(GatedPlateValidator):
    gate_group = "b"
    reason_region = "The unit code is two letters, e.g. LJ."
    reason_police = "Police is P, two digits, three digits."
    reason_diplomatic = "Diplomatic is CD, two digits, two digits."
    reason_serial = "The serial is three digits and two letters, or two letters and three digits."

    def judge(self, entry: PlateEntry) -> PlateValidation:
        region, a, b = entry.group("region"), entry.group("a"), entry.group("b")
        if region == "P":
            ok, reason = is_digits_of_length(a, 2) and is_digits_of_length(b, 3), self.reason_police
        elif region == "CD":
            ok, reason = is_digits_of_length(a, 2) and is_digits_of_length(b, 2), self.reason_diplomatic
        elif region not in _REGION_CODES:
            ok, reason = False, self.reason_region
        else:
            ok = ((is_digits_of_length(a, 3) and _two_letters(b))
                  or (_two_letters(a) and is_digits_of_length(b, 3)))
            reason = self.reason_serial
        return PlateValidation.valid() if ok else PlateValidation.invalid(reason)
