#!/usr/bin/env bash
# Phase-246: rule dialog pages can carry spacing in catalog.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
pages=d["dialogs"]["RuleOptionsDialog"]["pages"]
# spacing optional; ensure extract still valid
assert pages
print("rule pages", len(pages), "with spacing", sum(1 for p in pages if p.get("spacing")))
print("cleaned")
PY
echo "OK: phase246 e2e passed"
