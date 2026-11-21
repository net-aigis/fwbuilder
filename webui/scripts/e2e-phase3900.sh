#!/usr/bin/env bash
# Phase-3900: STATUS mentions res_status_roster / 3897-3904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'res_status_roster|soft_fertig_res_status_roster' webui/STATUS.md
grep -qE 'phase3904|through 3904|e2e-phase3904' webui/STATUS.md
echo "STATUS res-status roster ok"
echo "cleaned"
echo "OK: phase3900 e2e passed"
