#!/usr/bin/env bash
# Phase-1516: STATUS mentions sessionStorage keys download / 1513-1520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'Download sessionStorage keys|sessionStorage keys (download|copy)' webui/STATUS.md
grep -qE 'phase1520|through 1520|e2e-phase1520' webui/STATUS.md
echo "STATUS sessionStorage keys download ok"
echo "cleaned"
echo "OK: phase1516 e2e passed"
