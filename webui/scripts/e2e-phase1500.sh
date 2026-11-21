#!/usr/bin/env bash
# Phase-1500: STATUS mentions sessionStorage expandable / 1497-1504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'Soft-fertig sessionStorage keys|sessionStorage keys (detail|expandable)' webui/STATUS.md
grep -qE 'phase1504|through 1504|e2e-phase1504' webui/STATUS.md
echo "STATUS sessionStorage detail ok"
echo "cleaned"
echo "OK: phase1500 e2e passed"
