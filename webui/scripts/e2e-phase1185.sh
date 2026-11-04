#!/usr/bin/env bash
# Phase-1185: ssh_alternative_titles + ssh_refusal_path_titles on hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.deploy import SSH_ALTERNATIVE_TITLES, SSH_REFUSAL_PATH_TITLES
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("ssh_alternative_titles") == SSH_ALTERNATIVE_TITLES
assert h.get("ssh_refusal_path_titles") == SSH_REFUSAL_PATH_TITLES
assert s.get("ssh_alternative_titles") == SSH_ALTERNATIVE_TITLES
assert s.get("ssh_refusal_path_titles") == SSH_REFUSAL_PATH_TITLES
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1192
print("ssh titles", SSH_ALTERNATIVE_TITLES, SSH_REFUSAL_PATH_TITLES)
PY
echo "cleaned"
echo "OK: phase1185 e2e passed"
