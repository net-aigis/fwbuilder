#!/usr/bin/env bash
# Phase-1852: STATUS mentions track_note sessionStorage / 1849-1856.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'track_note.*sessionStorage|sessionStorage.*track_note|honestyTrackNote' webui/STATUS.md
grep -qE 'phase1856|through 1856|e2e-phase1856' webui/STATUS.md
echo "STATUS track_note sessionStorage ok"
echo "cleaned"
echo "OK: phase1852 e2e passed"
