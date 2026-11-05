#!/usr/bin/env bash
# Phase-3356: STATUS mentions honesty_readiness_roster export / 3353-3360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_readiness_roster.*(export|bundle)|Export.*honesty_readiness_roster' webui/STATUS.md
grep -qE 'phase3360|through 3360|e2e-phase3360' webui/STATUS.md
echo "STATUS honesty_readiness_roster export ok"
echo "cleaned"
echo "OK: phase3356 e2e passed"
