#!/usr/bin/env bash
# Phase-1964: STATUS mentions catalogs_complete/hard_gaps_remain / 1961-1968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'catalogs_complete|hard_gaps_remain' webui/STATUS.md
grep -qE 'phase1968|through 1968|e2e-phase1968' webui/STATUS.md
echo "STATUS catalog readiness flags ok"
echo "cleaned"
echo "OK: phase1964 e2e passed"
