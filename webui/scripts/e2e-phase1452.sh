#!/usr/bin/env bash
# Phase-1452: STATUS mentions sessionStorage surface/refusals/paths / 1449-1456.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'sessionStorage.*(soft.?fertig|related refusals|honesty paths)|softFertigSurface' webui/STATUS.md
grep -qE 'phase1456|through 1456|e2e-phase1456' webui/STATUS.md
echo "STATUS sessionStorage catalogs ok"
echo "cleaned"
echo "OK: phase1452 e2e passed"
