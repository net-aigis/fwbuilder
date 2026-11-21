#!/usr/bin/env bash
# Phase-350: ipt Logging has stacked pages 0 and 1.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
pages=d["dialogs"]["iptAdvancedDialog"]["pages"]
log=next(p for p in pages if p.get("title")=="Logging")
stacked=[s for s in log.get("sections") or [] if s.get("stacked")]
assert len(stacked)>=2, stacked
assert {s["stack_index"] for s in stacked}=={0,1}
print("ipt logging stacks", [(s["title"], s["stack_index"]) for s in stacked])
print("cleaned")
PY
echo "OK: phase350 e2e passed"
