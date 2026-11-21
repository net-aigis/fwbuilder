#!/usr/bin/env bash
# Phase-1356: STATUS mentions closure soft_fertig_surface / 1353-1360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'soft_fertig_surface.*(closure)|closure.*soft_fertig_surface' webui/STATUS.md
grep -qE 'phase1360|through 1360|e2e-phase1360' webui/STATUS.md
echo "STATUS closure surface ok"
echo "cleaned"
echo "OK: phase1356 e2e passed"
