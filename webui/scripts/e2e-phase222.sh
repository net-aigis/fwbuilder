#!/usr/bin/env bash
# Phase-222: compress plan shows percentage saved.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
API_DIR="$ROOT/webui/backend"
source "$API_DIR/.venv/bin/activate"
PYTHONPATH="$API_DIR${PYTHONPATH:+:$PYTHONPATH}" python3 - <<'PY'
import tempfile
from pathlib import Path
from fwbweb_api.deploy import plan_and_deploy

td = Path(tempfile.mkdtemp(prefix="fwbweb-ratio-"))
script = td / "fw.fw"
# compressible payload
script.write_text("#!/bin/sh\n" + ("echo pad\n" * 200) + "# files: * fw.fw\n", encoding="utf-8")
r = plan_and_deploy(
    host="192.0.2.7",
    user="root",
    local_script=script,
    remote_dir="/tmp/fwbweb-test",
    compress=True,
    dry_run=True,
    activate=False,
)
plan = "\n".join(r["plan"])
assert "−" in plan or "%" in plan, plan
print("compress ratio in plan ok")
print("cleaned")
PY
echo "OK: phase222 e2e passed"
