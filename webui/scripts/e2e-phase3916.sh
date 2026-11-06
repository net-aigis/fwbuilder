#!/usr/bin/env bash
# Phase-3916: STATUS mentions res_status_roster export / 3913-3920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'res_status_roster.*(export|bundle)|Export.*res_status_roster' webui/STATUS.md
grep -qE 'phase3920|through 3920|e2e-phase3920' webui/STATUS.md
echo "STATUS res_status_roster export ok"
echo "cleaned"
echo "OK: phase3916 e2e passed"
