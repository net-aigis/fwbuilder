#!/usr/bin/env bash
# Phase-199: post_config expanded preview has content / comments.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
API_DIR="$ROOT/webui/backend"
source "$API_DIR/.venv/bin/activate"
PYTHONPATH="$API_DIR${PYTHONPATH:+:$PYTHONPATH}" python3 - <<'PY'
from fwbweb_api.configlets import read_installer_configlet_file
r = read_installer_configlet_file(
    "pix_os",
    "installer_commands_post_config",
    expand=True,
)
assert r["ok"] and r["expanded"]
text = r.get("expanded_text") or ""
assert len(text) > 20, repr(text)
print("post_config expand ok", len(text))
print("cleaned")
PY
echo "OK: phase199 e2e passed"
