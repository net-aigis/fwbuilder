#!/usr/bin/env bash
# Phase-183: expect stub steps reflect pre/post configlets.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
API_DIR="$ROOT/webui/backend"
source "$API_DIR/.venv/bin/activate"
PYTHONPATH="$API_DIR${PYTHONPATH:+:$PYTHONPATH}" python3 - <<'PY'
from fwbweb_api.expect_installer import expect_installer_status
st = expect_installer_status("pix_os")
assert st["needed"] is True or st["interactive_installer"] is True
assert st["has_pre_config"] is True
assert st["has_post_config"] is True
assert any("pre_config" in s for s in st["desktop_steps"])
assert any("post_config" in s for s in st["desktop_steps"])
assert "installer_commands_pre_config" in st["names"]
print("expect steps from configlets ok", st["desktop_steps"])
print("cleaned")
PY
grep -q 'has_pre_config' webui/backend/fwbweb_api/expect_installer.py
echo "OK: phase183 e2e passed"
