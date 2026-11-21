#!/usr/bin/env bash
# Phase-273: buddy QLabel cells extracted as buddy_labels + external_label.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q '_buddy_labels_in_subtree' webui/scripts/extract-dialog-fields.py
grep -Fq 'external_label' webui/scripts/extract-dialog-fields.py
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract273.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
n_bl=sum(len(p.get("buddy_labels") or []) for info in d["dialogs"].values() for p in info.get("pages") or [])
n_ext=sum(1 for info in d["dialogs"].values() for v in (info.get("fields") or {}).values() if v.get("external_label"))
assert n_bl>0 and n_ext>0, (n_bl, n_ext)
print("buddy_labels ok", n_bl, "external_label", n_ext)
print("cleaned")
PY
echo "OK: phase273 e2e passed"
