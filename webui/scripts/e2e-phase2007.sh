#!/usr/bin/env bash
# Phase-2007: e2e-all lists 2001-2008; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2001 2002 2003 2004 2005 2006 2007 2008; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2001-2008 ok"
echo "cleaned"
echo "OK: phase2007 e2e passed"
