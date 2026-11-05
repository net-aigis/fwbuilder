#!/usr/bin/env bash
# Phase-3420: STATUS mentions session_storage_clear_roster / 3417-3424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'session_storage_clear_roster|soft_fertig_session_storage_clear_roster' webui/STATUS.md
grep -qE 'phase3424|through 3424|e2e-phase3424' webui/STATUS.md
echo "STATUS session storage clear roster ok"
echo "cleaned"
echo "OK: phase3420 e2e passed"
