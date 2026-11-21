#!/usr/bin/env bash
# Phase-1420: STATUS mentions related refusals download / 1417-1424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'Download related refusals|related refusals (download|copy)' webui/STATUS.md
grep -qE 'phase1424|through 1424|e2e-phase1424' webui/STATUS.md
echo "STATUS related refusals download ok"
echo "cleaned"
echo "OK: phase1420 e2e passed"
