#!/usr/bin/env bash
# Phase-1236: STATUS mentions soft_fertig_surface / 1233-1240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'soft_fertig_surface|soft-fertig surface' webui/STATUS.md
grep -qE 'phase1240|through 1240|e2e-phase1240' webui/STATUS.md
echo "STATUS soft_fertig_surface ok"
echo "cleaned"
echo "OK: phase1236 e2e passed"
