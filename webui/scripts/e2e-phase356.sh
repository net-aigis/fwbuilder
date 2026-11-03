#!/usr/bin/env bash
# Phase-356: HARD_GAP note mentions QStackedWidget + Interface chrome.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'QStackedWidget pages extracted' webui/backend/fwbweb_api/main.py
grep -Fq 'Interface section chrome' webui/backend/fwbweb_api/main.py
echo "hard-gap note stacked ok"
echo "cleaned"
echo "OK: phase356 e2e passed"
