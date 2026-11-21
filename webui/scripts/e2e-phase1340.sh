#!/usr/bin/env bash
# Phase-1340: STATUS mentions summary soft_fertig_surface / 1337-1344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'soft_fertig_surface.*(summary|mirror)|summary.*soft_fertig_surface' webui/STATUS.md
grep -qE 'phase1344|through 1344|e2e-phase1344' webui/STATUS.md
echo "STATUS summary surface ok"
echo "cleaned"
echo "OK: phase1340 e2e passed"
