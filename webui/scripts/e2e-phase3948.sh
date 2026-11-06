#!/usr/bin/env bash
# Phase-3948: STATUS mentions res_status_roster sessionStorage / 3945-3952.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'res_status_roster.*(sessionStorage|Clear)|sessionStorage.*res_status_roster' webui/STATUS.md
grep -qE 'phase3952|through 3952|e2e-phase3952' webui/STATUS.md
echo "STATUS res_status_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3948 e2e passed"
