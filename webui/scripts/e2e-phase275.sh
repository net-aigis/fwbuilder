#!/usr/bin/env bash
# Phase-275: QTabWidget tabPosition on dialog chrome.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'tab_position' webui/scripts/extract-dialog-fields.py
grep -Fq 'tab_position' webui/backend/fwbweb_api/platforms.py
grep -Fq 'tab_position' webui/frontend/src/api/client.ts
grep -Fq 'tabPosition' webui/frontend/src/components/FirewallExtras.tsx
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
assert any(info.get("tab_position") for info in d["dialogs"].values())
print("tab_position ok")
print("cleaned")
PY
echo "OK: phase275 e2e passed"
