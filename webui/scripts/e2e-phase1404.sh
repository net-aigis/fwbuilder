#!/usr/bin/env bash
# Phase-1404: STATUS mentions soft-fertig surface download / 1401-1408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'Download soft-fertig surface|soft-fertig surface (download|catalog)' webui/STATUS.md
grep -qE 'phase1408|through 1408|e2e-phase1408' webui/STATUS.md
echo "STATUS surface download ok"
echo "cleaned"
echo "OK: phase1404 e2e passed"
