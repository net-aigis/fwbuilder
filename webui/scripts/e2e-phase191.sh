#!/usr/bin/env bash
# Phase-191: Rule/Interface options render spacers + annotations.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
rule="$ROOT/webui/frontend/src/components/RuleOptions.tsx"
iface="$ROOT/webui/frontend/src/components/InterfaceOptions.tsx"
grep -q 'qt-spacer' "$rule"
grep -q 'qt-annotation' "$rule"
grep -q 'qt-spacer' "$iface"
grep -q 'qt-annotation' "$iface"
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
iface=d["dialogs"]["linux24IfaceOptsDialog"]["pages"][0]
assert iface.get("spacers"), iface
rule=d["dialogs"]["RuleOptionsDialog"]["pages"]
assert any(p.get("spacers") for p in rule)
print("rule/iface spacers in catalog ok")
print("cleaned")
PY
echo "OK: phase191 e2e passed"
