#!/usr/bin/env bash
# Phase-177: .ui QSpacerItem cells extracted into dialog pages.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract177.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
pages=d["dialogs"]["iptAdvancedDialog"]["pages"]
with_sp=[p for p in pages if p.get("spacers")]
assert with_sp, "expected spacers on at least one ipt page"
sp=with_sp[0]["spacers"][0]
assert "row" in sp and "column" in sp
print("spacers ok", with_sp[0]["title"], len(with_sp[0]["spacers"]))
print("cleaned")
PY
grep -q '_spacers_in_subtree' webui/scripts/extract-dialog-fields.py
grep -q 'spacers' webui/backend/fwbweb_api/platforms.py
echo "OK: phase177 e2e passed"
