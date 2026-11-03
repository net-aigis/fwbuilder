#!/usr/bin/env bash
# Phase-354: SchemaGroup.sections typed for iface/rule client schemas.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
python3 - <<'PY'
from pathlib import Path
t = Path("webui/frontend/src/api/client.ts").read_text()
# SchemaGroup must declare sections (not only option-schema groups)
idx = t.index("type SchemaGroup")
chunk = t[idx:idx+900]
assert "sections?:" in chunk, "SchemaGroup missing sections"
assert "stacked?:" in chunk
print("SchemaGroup.sections ok")
PY
echo "cleaned"
echo "OK: phase354 e2e passed"
