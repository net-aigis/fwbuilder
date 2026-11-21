#!/usr/bin/env bash
# Phase-76: keyboard shortcuts help catalog must list Alt+R/N/G/D and ?.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SRC="$ROOT/webui/frontend/src/shortcuts.ts"
test -f "$SRC"

python3 - <<PY
from pathlib import Path
text = Path("$SRC").read_text()
required = ["?", "Alt+R", "Alt+N", "Alt+G", "Alt+D", "Ctrl+S", "Ctrl+I", "f", "j", "Home / End"]
missing = [k for k in required if f'keys: "{k}"' not in text and f"keys: '{k}'" not in text]
# Home / End is written as one entry
if missing:
    raise SystemExit(f"missing shortcut keys: {missing}")
assert "shortcutsAsText" in text
assert "SHORTCUTS" in text
# count entries roughly
n = text.count("keys:")
print("shortcuts entries", n)
assert n >= 20
print("required keys present", ", ".join(required))
print("cleaned")
PY

# typecheck still covers App wiring
cd "$ROOT/webui/frontend"
npm run typecheck >/dev/null
echo "OK: phase76 e2e passed"
