#!/usr/bin/env bash
# Phase-1276: STATUS mentions surface detail / 1273-1280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'soft.?fertig surface (detail|expand)|Soft-fertig surface keys|surface expandable' webui/STATUS.md
grep -qE 'phase1280|through 1280|e2e-phase1280' webui/STATUS.md
echo "STATUS surface detail ok"
echo "cleaned"
echo "OK: phase1276 e2e passed"
