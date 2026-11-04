#!/usr/bin/env bash
# Phase-1268: STATUS mentions surface expansion / 1265-1272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'soft_fertig_surface.*refusals|surface keys.*refusals|related refusals in surface' webui/STATUS.md
grep -qE 'phase1272|through 1272|e2e-phase1272' webui/STATUS.md
echo "STATUS surface expansion ok"
echo "cleaned"
echo "OK: phase1268 e2e passed"
