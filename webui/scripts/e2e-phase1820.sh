#!/usr/bin/env bash
# Phase-1820: STATUS mentions honesty track note / 1817-1824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_track_note|track note|soft.fertig.*hard gaps' webui/STATUS.md
grep -qE 'phase1824|through 1824|e2e-phase1824' webui/STATUS.md
echo "STATUS track note ok"
echo "cleaned"
echo "OK: phase1820 e2e passed"
