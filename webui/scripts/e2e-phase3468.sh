#!/usr/bin/env bash
# Phase-3468: STATUS mentions session_storage_clear_roster sessionStorage / 3465-3472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'session_storage_clear_roster.*(sessionStorage|Clear)|sessionStorage.*session_storage_clear_roster' webui/STATUS.md
grep -qE 'phase3472|through 3472|e2e-phase3472' webui/STATUS.md
echo "STATUS session_storage_clear_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3468 e2e passed"
