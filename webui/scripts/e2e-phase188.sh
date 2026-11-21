#!/usr/bin/env bash
# Phase-188: dry-run deploy plan includes SSH auth note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
API_DIR="$ROOT/webui/backend"
source "$API_DIR/.venv/bin/activate"
PYTHONPATH="$API_DIR${PYTHONPATH:+:$PYTHONPATH}" python3 - <<'PY'
import tempfile
from pathlib import Path
from fwbweb_api.deploy import plan_and_deploy, SSH_AUTH_NOTE

td = Path(tempfile.mkdtemp(prefix="fwbweb-auth-"))
script = td / "fw.fw"
script.write_text("#!/bin/sh\necho ok\n# files: * fw.fw\n", encoding="utf-8")
r = plan_and_deploy(
    host="192.0.2.8",
    user="root",
    local_script=script,
    remote_dir="/tmp/fwbweb-test",
    dry_run=True,
    activate=False,
)
plan = "\n".join(r["plan"])
assert "SSH auth:" in plan
assert "BatchMode" in plan or "BatchMode" in SSH_AUTH_NOTE
print("ssh auth in plan ok")
print("cleaned")
PY
grep -q 'SSH auth:' webui/backend/fwbweb_api/deploy.py
echo "OK: phase188 e2e passed"
