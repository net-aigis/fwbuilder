#!/usr/bin/env bash
# Phase-3436: STATUS mentions session_storage_clear_roster export / 3433-3440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'session_storage_clear_roster.*(export|bundle)|Export.*session_storage_clear_roster' webui/STATUS.md
grep -qE 'phase3440|through 3440|e2e-phase3440' webui/STATUS.md
echo "STATUS session_storage_clear_roster export ok"
echo "cleaned"
echo "OK: phase3436 e2e passed"
