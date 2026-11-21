#!/usr/bin/env bash
# Phase-491: ssh_auth password + BatchMode capabilities.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'batch_mode_only' webui/backend/fwbweb_api/deploy.py
grep -Fq 'refusal_paths' webui/backend/fwbweb_api/deploy.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.deploy import ssh_auth_capabilities
c = ssh_auth_capabilities()
assert c["batch_mode_only"] is False
assert c["password_supported"] is True
assert "identity_file" in c["alternatives"]
assert "password" in c["implemented"]
assert "ssh_auth_password" not in c["refusal_paths"]
print("ssh auth honesty ok", c["alternatives"])
PY
echo "cleaned"
echo "OK: phase491 e2e passed"
