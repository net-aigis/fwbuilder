#!/usr/bin/env bash
# Phase-180: SSH BatchMode / password-auth honesty in deploy result + UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
deploy="$ROOT/webui/backend/fwbweb_api/deploy.py"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'SSH_AUTH_NOTE' "$deploy"
grep -q 'password_supported' "$deploy"
grep -q 'BatchMode' "$extras"
grep -q 'keyboard-interactive' "$extras"
API_DIR="$ROOT/webui/backend"
source "$API_DIR/.venv/bin/activate"
PYTHONPATH="$API_DIR${PYTHONPATH:+:$PYTHONPATH}" python3 - <<'PY'
from fwbweb_api.deploy import SSH_AUTH_NOTE
assert "BatchMode" in SSH_AUTH_NOTE
assert "Password" in SSH_AUTH_NOTE or "password" in SSH_AUTH_NOTE
print("ssh auth note ok")
print("cleaned")
PY
echo "OK: phase180 e2e passed"
