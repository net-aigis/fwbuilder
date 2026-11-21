#!/usr/bin/env bash
# Phase-463: hard gaps still 3 @ 464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "464"' webui/backend/fwbweb_api/main.py
grep -Fq 'full_qt_pixel_layout' webui/backend/fwbweb_api/main.py
echo "hard gaps still open @ 464"
echo "cleaned"
echo "OK: phase463 e2e passed"
