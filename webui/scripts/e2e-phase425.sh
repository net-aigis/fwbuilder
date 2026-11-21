#!/usr/bin/env bash
# Phase-425: LOG/ULOG option_enable shared across ipt/ipcop/secuwall.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import _OPTION_OPTION_ENABLE
for stem in ("iptAdvancedDialog","ipcopAdvancedDialog","secuwallAdvancedDialog"):
  assert stem in _OPTION_OPTION_ENABLE
  assert any(r["target"]=="ulog_cprange" for r in _OPTION_OPTION_ENABLE[stem])
print("shared LOG/ULOG enable ok")
PY
echo "cleaned"
echo "OK: phase425 e2e passed"
