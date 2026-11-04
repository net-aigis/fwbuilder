#!/usr/bin/env bash
# Phase-673: SSH alternative_notes + refusal_path_notes.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.deploy import ssh_auth_capabilities, SSH_ALTERNATIVE_NOTES, SSH_REFUSAL_PATH_NOTES
cap = ssh_auth_capabilities()
assert cap.get("alternative_notes") == SSH_ALTERNATIVE_NOTES
assert cap.get("refusal_path_notes") == SSH_REFUSAL_PATH_NOTES
h = m.hard_gaps()
assert h.get("ssh_alternative_notes") == SSH_ALTERNATIVE_NOTES
assert h.get("ssh_refusal_path_notes") == SSH_REFUSAL_PATH_NOTES
assert "ssh_alternative_notes" in (m.HARD_GAP_NOTES.get("password_keyboard_interactive_ssh") or "")
assert m.WEBUI_SOFT_COMPLETE_PHASE == "680"
print("ssh notes ok", len(SSH_ALTERNATIVE_NOTES), len(SSH_REFUSAL_PATH_NOTES))
PY
echo "cleaned"
echo "OK: phase673 e2e passed"
